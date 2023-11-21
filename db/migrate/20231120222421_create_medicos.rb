class CreateMedicos < ActiveRecord::Migration[7.1]
  def change
    create_table :medicos do |t|
      t.string :nome
      t.string :especialidade
      t.string :email
      t.string :telefone
      t.string :crm
      t.string :endereco

      t.timestamps
    end
  end
end
