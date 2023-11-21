class CreateConsulta < ActiveRecord::Migration[7.1]
  def change
    create_table :consulta do |t|
      t.references :paciente, null: false, foreign_key: true
      t.references :medico, null: false, foreign_key: true
      t.datetime :data
      t.string :local

      t.timestamps
    end
  end
end
