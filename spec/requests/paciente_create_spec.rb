require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/pacientes', type: :request do

#  let(:access_token) { Base64::encode64("Criminal-Hunter:Wanteds") }
#  let(:Authorization) { "Basic #{access_token}" }

  path '/pacientes' do
    post('Cria pacientes no sistema') do
      tags 'Pacientes'
      consumes 'application/json'
      produces 'application/json'
#      security [basic_auth: []]
#      parameter name: :Authorization, 
#                in: :header, 
#                type: :string,
#                description: 'Token de autenticação padrão Basic Authentication composto por username e password',
#                required: true

      parameter name: :paciente,
        in: :body,
        schema: {
          type: :object,
          properties: {
            nome: {
              type: :string,
              example: 'Alexsandro Perreira da Silva',
              description: 'Nome do paciente'
            },
            email: {
              type: :string,
              example: 'russ@walter-beer.test',
              description: 'E-mail do paciente'
            },
            telefone: {
              type: :string,
              example: '269-233-7639 19782',
              description: 'Telefone para contato'
            },
            cpf: {
              type: :string,
              example: '893673654911',
              description: 'CPF do paciente'
            },
            endereco: {
              type: :string,
              example: '5785 Swift Throughway, New Nicolmouth',
              description: 'Endereco do paciente'
            },
            data_nascimento: {
              type: :string,
              example: '28/02/1936',
              description: 'Data de nascimento do paciente'
            }
          }
        }
        
      response 201, 'successful' do
        let(:pacientes) { FactoryBoy.attributes_for(:paciente) }
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