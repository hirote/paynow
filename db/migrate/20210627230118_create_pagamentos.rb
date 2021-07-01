class CreatePagamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :pagamentos do |t|
      t.string :nome
      t.string :tipo
      t.string :icone
      t.decimal :taxa_cobrança
      t.decimal :taxa_max_reais
      t.boolean :habilitado

      t.timestamps
    end
  end
end
