require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/pacientes/{id}', type: :request do

 
  path '/pacientes/{id}' do
    get('Busca pacientes do sistema pelo ID') do
      tags 'Pacientes'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'ID unico incremental do registro na tabela',
                required: true

      response 404, 'not_found' do
        let!(:id) { 1000000000 }

        schema type: :object,
        properties: {},
        example: {
          "error": "Registro não encontrado"
        }

        run_test!
      end

      response 200, 'successful' do
        let!(:id) { create(:paciente).id }
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
          },
          example: [
            {
              "id": 1,
              "nome": "João da Silva",
              "email": "russ@walter-beer.test",
              "telefone": "269-233-7639 19782",
              "cpf": "893673654911",
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