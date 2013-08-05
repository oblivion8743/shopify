class Shopifyproduct < ActiveRecord::Base

belongs_to :shopifylandingpage
has_many :shopifyvariants
attr_accessible :shopifylandingpage_id, :productid, :producttype, :producttitle, :producthandle, :imageurl
 
end
