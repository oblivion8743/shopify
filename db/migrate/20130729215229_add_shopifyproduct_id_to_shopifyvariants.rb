class AddShopifyproductIdToShopifyvariants < ActiveRecord::Migration
  def change
    remove_column :shopifyvariants, :shopifyproduct_id

  end
end
