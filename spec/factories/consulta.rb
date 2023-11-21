FactoryBot.define do
  factory :consulta do
    paciente { association :paciente, strategy: :create }
    medico { association :medico, strategy: :create }
    data { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
