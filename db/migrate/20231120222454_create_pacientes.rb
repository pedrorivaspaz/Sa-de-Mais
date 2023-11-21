class CreatePacientes < ActiveRecord::Migration[7.1]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cpf
      t.string :endereco
      t.string :data_nascimento

      t.timestamps
    end
  end
end
