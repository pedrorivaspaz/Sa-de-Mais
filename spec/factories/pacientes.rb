FactoryBot.define do
  factory :paciente do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    telefone { Faker::PhoneNumber.phone_number }
    cpf { Faker::Number.unique.number(digits: 11) }
    endereco { Faker::Address.full_address }
    data_nascimento { Faker::Date.birthday(min_age: 18, max_age: 90).strftime("%d/%m/%Y") }
  end
end
