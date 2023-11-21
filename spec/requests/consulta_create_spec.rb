require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/consulta', type: :request do

#  let(:access_token) { Base64::encode64("Criminal-Hunter:Wanteds") }
#  let(:Authorization) { "Basic #{access_token}" }

  path '/consulta' do
    post('Cria consulta no sistema') do
      tags 'Consultas'
      consumes 'application/json'
      produces 'application/json'
#      security [basic_auth: []]
#      parameter name: :Authorization, 
#                in: :header, 
#                type: :string,
#                description: 'Token de autenticação padrão Basic Authentication composto por username e password',
#                required: true

      parameter name: :consulta,
        in: :body,
        schema: {
          type: :object,
          properties: {
            paciente_id: {
              type: :string,
              example: 1,
              description: 'ID unico incremental do registro na tabela'
            },
            medico_id: {
              type: :string,
              example: 2,
              description: 'ID unico incremental do registro na tabela'
            },        
            paciente_nome: {
              type: :string,
              example: 'Alexsandro Perreira da Silva',
              description: 'Nome do paciente'
            },
            medico_nome: {
              type: :string,
              example: 'Pedro da Silva',
              description: 'Nome do médico'
            },  
            especialidade: {
              type: :string,
              example: 'Cardiologista',
              description: 'Especialidade do médico'
            },
            data: {
              type: :string,
              example: '2023-11-21 04:13:55',
              description: 'Data da Consulta'
            },
            local: {
              type: :string,
              example: '269-233-7639 19782',
              description: 'Endereço da Consulta'
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