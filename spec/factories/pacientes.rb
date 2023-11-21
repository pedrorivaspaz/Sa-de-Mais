FactoryBot.define do
  factory :paciente do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    telefone { Faker::PhoneNumber.phone_number }
    cpf { Faker::Number.unique.number(digits: 11) }
    endereco { Faker::Address.full_address }
  end
end
