class CreateTableCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :table_cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity
      t.timestamps
    end
  end
end
