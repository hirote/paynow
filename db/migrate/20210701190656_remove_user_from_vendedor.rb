class RemoveUserFromVendedor < ActiveRecord::Migration[6.1]
  def change
    remove_column :vendedors, :email, :string
    remove_column :vendedors, :senha, :string
  end
end
