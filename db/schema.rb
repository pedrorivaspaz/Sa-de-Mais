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

ActiveRecord::Schema[7.1].define(version: 2023_11_20_222842) do
  create_table "consulta", force: :cascade do |t|
    t.integer "paciente_id", null: false
    t.integer "medico_id", null: false
    t.datetime "data"
    t.string "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_consulta_on_medico_id"
    t.index ["paciente_id"], name: "index_consulta_on_paciente_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.string "nome"
    t.string "especialidade"
    t.string "email"
    t.string "telefone"
    t.string "crm"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cpf"
    t.string "endereco"
    t.string "data_nascimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "consulta", "medicos"
  add_foreign_key "consulta", "pacientes"
end
