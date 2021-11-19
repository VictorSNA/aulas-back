class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end
