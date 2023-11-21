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
    50.times do
      Paciente.create!(
        nome: Faker::Name.name,
        email: Faker::Internet.email,
        telefone: Faker::PhoneNumber.phone_number,
        cpf: Faker::Number.unique.number(digits: 11),
        endereco: Faker::Address.full_address,
        data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 90).strftime("%d/%m/%Y")
      )
    end
  end

  desc "Adiciona médicos"
  task add_medicos: :environment do
    30.times do
      especialidades = ['Cardiologista', 'Ortopedista', 'Dermatologista', 'Clínico Geral', 'Pediatra']

      Medico.create!(
        nome: Faker::Name.name,
        especialidade: especialidades.sample,
        email: Faker::Internet.email,
        telefone: Faker::PhoneNumber.phone_number,
        crm: Faker::Number.unique.number(digits: 7),
        endereco: Faker::Address.full_address
      )
    end
  end

  desc "Adiciona consultas"
   task add_consultas: :environment do
    pacientes = Paciente.all.to_a
    medicos = Medico.all.to_a

    40.times do
      paciente = pacientes.sample
      medico = medicos.sample

      Consulta.create!(
        paciente_nome: paciente.nome,
        paciente_id: paciente.id,
        medico_nome: medico.nome,
        medico_id: medico.id,
        especialidade: medico.especialidade,
        data: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
        local: medico.endereco
      )
    end
  end
end
