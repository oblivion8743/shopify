class Shopifyvariant < ActiveRecord::Base
  attr_accessible :integer, :integer, :integer, :string, :string, :string, :string, :string, :string, :variantgrams, :variantid, :variantinvqty, :variantop1, :variantop2, :variantposition, :variantprice, :variantsku, :varianttitle
  belongs_to :shopifyproducts
end
