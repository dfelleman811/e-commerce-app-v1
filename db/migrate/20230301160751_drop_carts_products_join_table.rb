class DropCartsProductsJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :carts, :products
  end
end
