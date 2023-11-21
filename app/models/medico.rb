class Medico < ApplicationRecord
  has_many :consultas, dependent: :destroy

scope :search_by_especialidade, ->(especialidade) {
  where("especialidade LIKE ?", "%#{sanitize_sql_like(especialidade)}%").order(:id)
}

scope :search_by_nome, ->(nome) {
  where("nome LIKE ?", "%#{sanitize_sql_like(nome)}%").order(:id)
}


end