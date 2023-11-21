require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/consultas/{id}', type: :request do

#    let(:access_token) { Base64::encode64("#{ENV['USERNAME_SYNERGIA']}:#{ENV['PASSWORD_SYNERGIA']}") }
#    let(:Authorization) { "Basic #{access_token}" }
 
  path '/consultas/{id}' do
    put('Atualiza consultas do sistema') do
      tags 'Consultas'
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
                description: 'Parâmetro ID para filtrar consultas',
                required: true 

      

      response 200, 'successful' do
        let(:consulta) { create_list(:consulta) }
        let(:id) {consulta.id}
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
            paciente_id: {
              type: :string,
              description: 'ID unico incremental do registro na tabela',
              nullable: false
            },
            medico_id: {
              type: :string,
              description: 'ID unico incremental do registro na tabela',
              nullable: false
            },
            paciente_nome: {
              type: :string,
              description: 'Nome do Paciente',
              nullable: false
            },
           medico_nome: {
              type: :string,
              description: 'Nome do Médico',
            },
            especialidade: {
              type: :string,
              description: 'Especialidade do Médico'
            },
            data: {
              type: :string,
              description: 'Data da Consulta'
            },
            local: {
              type: :string,
              description: 'Endereço da Consulta'
            }
          },
          example: [
            {
              "id": 3,
              "paciente_id": 7,
              "medico_id": 29,
              "paciente_nome": "Treena Jaskolski",
              "medico_nome": "Marlin Murray",
              "especialidade": "Dermatologista",
              "data": "2023-11-21 04:13:55",
              "local": "9151 Maxima Ranch, Haagland, AR 15975-1803",
              "created_at": "2023-11-21T17:59:21.181Z",
              "updated_at": "2023-11-21T17:59:21.181Z"
            }
          ]
        run_test!
      end
    end
  end
end

 