class CreateAdpays < ActiveRecord::Migration[6.1]
  def change
    create_table :adpays do |t|
      t.string :nome
      t.string :email
      t.string :senha

      t.timestamps
    end
  end
end
