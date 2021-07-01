class CreateEmpresas < ActiveRecord::Migration[6.1]
  def change
    create_table :empresas do |t|
      t.string :cnpj
      t.string :razao_social
      t.string :endereco
      t.string :email_faturamento
      t.string :email_dominio
      t.string :token

      t.timestamps
    end
  end
end
