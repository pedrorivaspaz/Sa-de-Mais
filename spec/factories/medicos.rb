FactoryBot.define do
  factory :medico do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    telefone { Faker::PhoneNumber.phone_number }
    crm { Faker::Number.unique.number(digits: 7) }
    endereco { Faker::Address.full_address }
  end
end
