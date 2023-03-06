class AddQuantityToCartsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :quantity, :int
  end
end
