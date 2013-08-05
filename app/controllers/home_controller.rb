class HomeController < ApplicationController
  
require 'csv'
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end
  
  def index
    # get 10 products
    @products = ShopifyAPI::Product.find(:all)    


#initlialize Landing pages
    @products.each_with_index do| product, index|  
     if product.product_type == "LandingPage"        
        if !Shopifylandingpage.exists?(:productid => product.id)
          Shopifylandingpage.create(:productid=> product.id)   

        end   #if landing page exists    
        shopifylanding = Shopifylandingpage.find(:first, :conditions => {:productid => product.id}) 

        product.collections.each do |coll|
          if coll.title.include? 'Set'
            shopifylanding.update_attributes :setname => coll.title
          end
        end            
        shopifylanding.update_attributes :producttitle => product.title, :producthandle =>product.handle, :producthtml => product.body_html
        if product.images[0] != nil
          shopifylanding.update_attributes :productimage1 => product.images[0].src   
        else
          shopifylanding.update_attributes :productimage1 => ""  
        end
         if product.images[1] != nil
          shopifylanding.update_attributes :productimage2 => product.images[1].src
           else
          shopifylanding.update_attributes :productimage2 => ""  
        end
         if product.images[2] != nil
          shopifylanding.update_attributes :productimage3 => product.images[2].src
           else
          shopifylanding.update_attributes :productimage3 => ""  
        end # if product images exist
         
       end  #if product is lnding page
    end  #landing page loop

#Loop again for the products
      productset = ""
      @products.each_with_index do| product, index|  
      
      if product.product_type == "Product"      
         
         product.collections.each do |coll| #get landingpage with corresponding set
          if coll.title[0..2] == 'Set'
            productset = coll.title
          end         
         end      #collections loop
         lp = Shopifylandingpage.find(:first, :conditions => {:setname => productset})   


        if !Shopifyproduct.exists?(:productid => product.id)
          lp.shopifyproducts.create(:productid =>product.id)
          
        end

        shopifyprod = Shopifyproduct.find(:first, :conditions => {:productid => product.id}) 

        product.variants.each do |var|
          if !Shopifyvariant.exists?(:variantid => var.id)
            shopifyprod.shopifyvariants.create(:variantid => var.id)
          end
          shopifyvar = Shopifyvariant.find(:first, :conditions => {:variantid => var.id})
          shopifyvar.update_attributes :varianttitle => var.title, :variantinvqty => var.inventory_quantity, :variantprice => var.price
          shopifyvar.update_attributes :variantop1 => var.option1, :variantop2 => var.option2, :variantgrams => var.grams
          shopifyvar.update_attributes :variantposition => var.position, :variantsku => var.sku          
        end  #variants loop
        


        shopifyprod.update_attributes :producttitle => product.title, :producthandle => product.handle
        if product.images[0] != nil
          shopifyprod.update_attributes :imageurl => product.images[0].src
        else
          shopifyprod.update_attributes :imageurl => ""
        end
        
      end    #if products = product
    end  #products loop
     Shopifyproduct.update_all( "producttype = 'Product'") 
    Shopifylandingpage.update_all( "producttype = 'LandingPage'")   


   CSV.open("test.sxc", "wb") do |csv|
   csv << ["id", "title", "description", "google_product_category", "product_type", "link", "image_link", "additional_image_link",
   "condition", "availability", "Price", "brand", "item_group_id", "size", "pattern", "tax", "shipping", 
   "adwords_grouping", "adwords_labels", "mpn"]

   shopifyvar = Shopifyvariant.find(:all)
   shopifyvar.sort_by!{ |m| m.variantsku}  #sort by sku
   shopifyvar.each do |e|
      shopifyprod = Shopifyproduct.find(:first, :conditions =>{:id => e.shopifyproduct_id})
      shopifyland = Shopifylandingpage.find(:first, :conditions => {:id => shopifyprod.shopifylandingpage_id})
   
      
      descrip = shopifyland.producthtml #decription
      descrip.gsub!(/(<[^>]*>)|\n|\t/s) {" "} #cut description html
      

      categ = shopifyprod.producttitle # Category #shipping #adwords_grouping

      if categ.include? 'Duvet'
        categ = "duvet"
        ship = "8"
        adwordgr = "Duvet Covers"
      end
      if categ.include? "Sham"
        if !categ.include? "Luxe"
          categ = "sham"
          ship = "3"
          adwordgr = "Sham"
        end
      end
      if categ.include? "Sheet"
        categ = "sheet"
        ship = "6"
        if categ.include? "Fitted"
           adwordgr = "FittedSheet"
        end #Fitted
        if categ.include? "Flat"
           adwordgr = "FlatSheet"
        end #Flat
        if categ.include? "Sheet Set"
           adwordgr = "SheetSet"
        end #sheet set
      end #Sheet     
      if categ.include? "Swatch"
        categ = "swatch"
        ship = "0"
        adwordgr = "Swatch"
      end #Swatch
      if categ.include? "Luxe"
        categ = "plain"
        adwordgr = "White Goods"
        ship = "5"
        if categ.include? "Mattress Pad" 
          ship = "10"        
        end
        if categ.include? "Comforter"
          ship = "10"
        end
      end
      if categ.include? "Pillow Case"
        categ = "sheet"
        ship = "5"
        adwordgr = "PillowCase"
      end

      url = "http://crane-and-canopy-dev-test-shop.myshopify.com/products/" # url

      if e.variantinvqty == 0 #stock
        stock = "out of stock"
      else
        stock = "in stock"
      end

      tax = "US:CA:7.50:n,US:940*:8.50:n" #tax

      if categ == "duvet" || categ == "sham"#set
        adwordlabel = "Duvet Sets"
      end
      if categ == "swatch"
        adwordlabel = "Swatch"
      end
      if categ == "plain"
        adwordlabel = "White Goods"
      end
      if categ == "sheet"
        adwordlavel = "Sheet Sets"
      end

   
      csv << [e.variantsku, shopifyprod.producttitle + " - " + e.varianttitle, descrip, categ, categ, 
              url + shopifyprod.producthandle, shopifyland.productimage1, shopifyprod.imageurl, "new",
               stock, e.variantprice.to_s + " USD", "Crane & Canopy", shopifyland.producttitle,
                e.variantop1, categ, tax, "US:::"+ship+" USD", adwordgr, adwordlabel, e.variantsku]
    end #loop
   end #close test sxc

    # get latest 5 orders.
    @orders   = ShopifyAPI::Order.find(:all, :params => {:limit => 5, :order => "created_at DESC" })
  end  
  
end