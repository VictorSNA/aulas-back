class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :cpf, null: false
      t.string :telephone, null: false
      t.string :cep, null: false
      t.string :public_place, null: false
      t.string :address, null: false
      t.string :address_number, null: false
      t.string :complement, null: false
      t.string :permission, null: false

      t.timestamps
    end
  end
end
