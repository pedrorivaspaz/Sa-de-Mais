namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    %x(rails db:drop)
    %x(rails db:create)
    %x(rails db:migrate)
    Rake::Task['dev:add_pacientes'].invoke
    Rake::Task['dev:add_medicos'].invoke
    Rake::Task['dev:add_consultas'].invoke
  end

  desc "Adiciona pacientes"
  task add_pacientes: :environment do
    10.times do
      Paciente.create!(
        nome: Faker::Name.name,
        email: Faker::Internet.email,
        telefone: Faker::PhoneNumber.phone_number,
        cpf: Faker::Number.unique.number(digits: 11),
        endereco: Faker::Address.full_address
      )
    end
  end

  desc "Adiciona médicos"
  task add_medicos: :environment do
    10.times do
      Medico.create!(
        nome: Faker::Name.name,
        email: Faker::Internet.email,
        telefone: Faker::PhoneNumber.phone_number,
        crm: Faker::Number.unique.number(digits: 7),
        endereco: Faker::Address.full_address
      )
    end
  end

  desc "Adiciona consultas"
  task add_consultas: :environment do

  end
end
