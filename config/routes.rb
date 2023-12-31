Rails.application.routes.draw do
 
  resources :consulta do
    collection do
      get 'search', to: 'consulta#search'
    end
  end

  resources :pacientes do
    collection do
      get 'search', to: 'pacientes#search'
    end
  end

  resources :medicos do
    collection do
      get 'search', to: 'medicos#search'
    end
  end

  #Swagger
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
