# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_01_192220) do

  create_table "clientes", force: :cascade do |t|
    t.string "token"
    t.integer "vendedor_id", null: false
    t.integer "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_clientes_on_empresa_id"
    t.index ["vendedor_id"], name: "index_clientes_on_vendedor_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "cnpj"
    t.string "razao_social"
    t.string "endereco"
    t.string "email_faturamento"
    t.string "email_dominio"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pagamentos", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.string "icone"
    t.decimal "taxa_cobrança"
    t.decimal "taxa_max_reais"
    t.boolean "habilitado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "valor"
    t.string "token"
    t.decimal "desconto"
    t.integer "pagamento_id", null: false
    t.integer "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["empresa_id"], name: "index_produtos_on_empresa_id"
    t.index ["pagamento_id"], name: "index_produtos_on_pagamento_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "vendedors", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.integer "empresa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "usuario_id", null: false
    t.index ["empresa_id"], name: "index_vendedors_on_empresa_id"
    t.index ["usuario_id"], name: "index_vendedors_on_usuario_id"
  end

  add_foreign_key "clientes", "empresas"
  add_foreign_key "clientes", "vendedors"
  add_foreign_key "produtos", "empresas"
  add_foreign_key "produtos", "pagamentos"
  add_foreign_key "vendedors", "empresas"
  add_foreign_key "vendedors", "usuarios"
end
