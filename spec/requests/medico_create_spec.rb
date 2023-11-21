require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/medicos', type: :request do

#  let(:access_token) { Base64::encode64("Criminal-Hunter:Wanteds") }
#  let(:Authorization) { "Basic #{access_token}" }

  path '/medicos' do
    post('Cria médicos no sistema') do
      tags 'Médicos'
      consumes 'application/json'
      produces 'application/json'
#      security [basic_auth: []]
#      parameter name: :Authorization, 
#                in: :header, 
#                type: :string,
#                description: 'Token de autenticação padrão Basic Authentication composto por username e password',
#                required: true

      parameter name: :medico,
        in: :body,
        schema: {
          type: :object,
          properties: {
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
          }
        }
        
      response 201, 'successful' do
        let(:medicos) { FactoryBoy.attributes_for(:medico) }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end