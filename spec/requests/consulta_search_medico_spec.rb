require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/consulta/search?medico_nome={medico_nome}', type: :request do

 
  path '/consulta/search?medico_nome={medico_nome}' do
    get('Busca consultas do sistema pelo nome do médico') do
      tags 'Consultas'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :medico_nome,
                in: :query,
                type: :string,
                description: 'Nome do médico',
                required: true

      parameter name: :page,
                in: :query,
                type: :integer,
                description: 'Navega entre paginas para trazer os resultados paginados',
                required: false


      response 404, 'not_found' do
        let!(:id) { 1000000000 }

        schema type: :object,
        properties: {},
        example: {}

        run_test!
      end

      response 200, 'successful' do
        let!(:medico_nome) { create(:consulta).id }
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