class DropCartsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :carts do |t|
      t.integer :user_id
    end
  end
end
