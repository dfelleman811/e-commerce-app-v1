class CreateJoinTableUsersProducts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :products, table_name: :carts
  end
end
