class CreateVendedors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendedors do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.string :cpf
      t.references :empresa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
