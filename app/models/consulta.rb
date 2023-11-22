class Consulta < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  scope :search_by_paciente_nome, ->(paciente_nome) {
    where("paciente_nome LIKE ?", "%#{sanitize_sql_like(paciente_nome)}%").order(:id)
  }
  
  scope :search_by_medico_nome, ->(medico_nome) {
    where("medico_nome LIKE ?", "%#{sanitize_sql_like(medico_nome)}%").order(:id)
  }
end
