require 'swagger_helper'

# to update api-doc: bundle exec rake rswag:specs:swaggerize
RSpec.describe '/medicos/{id}', type: :request do

#  let(:access_token) { Base64::encode64("Criminal-Hunter:Wanteds") }
#  let(:Authorization) { "Basic #{access_token}" }
 
  path '/medicos/{id}' do
    delete('Deleta médicos do sistema') do
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
                description: 'Parâmetro ID ',
                required: true

        response 204, 'deleted' do
        let(:medicos) { create_list(:medico) }
        let(:id) { medicos.first.id } 

        run_test!
      end

      response '404', 'not found' do
        let(:id) { 'non_existent_id' } 

        run_test!
      end
    end
  end
end