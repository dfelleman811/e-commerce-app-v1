class RenameTableCartItemsToCartItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :table_cart_items, :cart_items
  end
end
