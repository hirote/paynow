class RemoveEmailDominioFromEmpresa < ActiveRecord::Migration[6.1]
  def change
    remove_column :empresas, :email_dominio, :string
  end
end
