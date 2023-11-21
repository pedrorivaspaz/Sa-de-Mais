require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/medicos/{id}', type: :request do

#    let(:access_token) { Base64::encode64("#{ENV['USERNAME_SYNERGIA']}:#{ENV['PASSWORD_SYNERGIA']}") }
#    let(:Authorization) { "Basic #{access_token}" }
 
  path '/medicos/{id}' do
    put('Atualiza médicos do sistema') do
      tags 'Médicos'
      consumes 'application/json'
      produces 'application/json'
#      security [basic_auth: []]
#      parameter name: :Authorization,
#                in: :header,
#                type: :string,
#                description: 'Token de autenticação padrão Basic Authentication composto por username e password',
#                required: true
 
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Parâmetro ID para filtrar médicos',
                required: true 

      

      response 200, 'successful' do
        let(:medico) { create_list(:medico) }
        let(:id) {medico.id}
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        schema type: :object,
          properties: {
            id: {
              type: :integer,
              description: 'ID unico incremental do registro na tabela',
              nullable: false
            },
            nome: {
              type: :string,
              example: 'Alexsandro Perreira da Silva',
              description: 'Nome do médico'
            },
            especialidade: {
              type: :string,
              example: 'Cardiologista',
              description: 'Especialidade do médico'
            },
            email: {
              type: :string,
              example: 'russ@walter-beer.test',
              description: 'E-mail do médico'
            },
            telefone: {
              type: :string,
              example: '269-233-7639 19782',
              description: 'Telefone para contato'
            },
            crm: {
              type: :string,
              example: '893673654911',
              description: 'CRM do médico'
            },
            endereco: {
              type: :string,
              example: '5785 Swift Throughway, New Nicolmouth',
              description: 'Endereco do consultório'
            }
          },
          example: [
            {
              "id": 1,
              "nome": "Pedro Vasconcelos",
              "especialidade": "Cardiologista",
              "email": "russ@walter-beer.test",
              "telefone": "269-233-7639 19782",
              "crm": "8742560",
              "endereco": "5785 Swift Throughway, New Nicolmouth, RI 95893-9831",
              "data_nascimento": "28/02/1936",
              "created_at": "20/05/2022 14:30:22",
              "updated_at": "22/05/2022 09:15:37"
            }
          ]
        run_test!
      end
    end
  end
end

 