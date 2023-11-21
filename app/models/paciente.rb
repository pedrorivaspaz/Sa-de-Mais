class Paciente < ApplicationRecord
  has_many :consultas, dependent: :destroy

  scope :search_by_nome, ->(nome) {
    where("nome LIKE ?", "%#{nome}%").order(:id)
  }
end
