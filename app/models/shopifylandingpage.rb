class Shopifylandingpage < ActiveRecord::Base
    has_many :shopifyproducts
attr_accessible :shopifylandingpage_id, :producttype, :integer, :producttitle, :producthandle, :productid, :producthtml, :productimage1, :productimage2, :productimage3, :producthtml, :setname  
 
end
