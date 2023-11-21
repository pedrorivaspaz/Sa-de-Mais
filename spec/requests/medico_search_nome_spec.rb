require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/medicos/search?nome={nome}', type: :request do

 
  path '/medicos/search?nome={nome}' do
    get('Busca médicos do sistema pelo nome') do
      tags 'Médicos'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :nome,
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
        let!(:nome) { create(:medico).id }
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
              description: 'Nome do Médico',
              nullable: false
            },
            especialidade: {
              type: :string,
              description: 'Especialidade do Médico',
              nullable: false
            },
            email: {
              type: :string,
              description: 'E-mail do Médico',
              nullable: false
            },
           telefone: {
              type: :string,
              description: 'Telefone para contato',
            },
            crm: {
              type: :string,
              description: 'CRM do médico'
            },
          endereco: {
              type: :string,
              description: 'Endereço do consultório'
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