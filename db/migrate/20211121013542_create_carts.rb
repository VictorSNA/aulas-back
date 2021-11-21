class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :sessionid
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.float :unit_value
      t.float :total

      t.timestamps
    end
  end
end
