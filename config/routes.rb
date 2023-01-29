Rails.application.routes.draw do
  # Defines the root path route ('/')
  root 'kml_documents#index'

  resources :kml_documents
end
