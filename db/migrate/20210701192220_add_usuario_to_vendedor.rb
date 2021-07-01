class AddUsuarioToVendedor < ActiveRecord::Migration[6.1]
  def change
    add_reference :vendedors, :usuario, null: false, foreign_key: true
  end
end
