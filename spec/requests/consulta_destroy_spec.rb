require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/consulta/{id}', type: :request do

#  let(:access_token) { Base64::encode64("Criminal-Hunter:Wanteds") }
#  let(:Authorization) { "Basic #{access_token}" }
 
  path '/consulta/{id}' do
    delete('Deleta consulta do sistema') do
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
                description: 'Parâmetro ID ',
                required: true

        response 204, 'deleted' do
        let(:consulta) { create_list(:consulta) }
        let(:id) { consulta.first.id } 

        run_test!
      end

      response '404', 'not found' do
        let(:id) { 'non_existent_id' } 

        run_test!
      end
    end
  end
end