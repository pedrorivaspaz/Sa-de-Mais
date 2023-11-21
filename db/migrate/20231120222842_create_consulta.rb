class CreateConsulta < ActiveRecord::Migration[7.1]
  def change
    create_table :consulta do |t|
      t.references :paciente, null: false, foreign_key: true
      t.references :medico, null: false, foreign_key: true
      t.string :paciente_nome
      t.string :medico_nome
      t.string :especialidade
      t.datetime :data
      t.string :local

      t.timestamps
    end
  end
end
