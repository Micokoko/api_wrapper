# config/routes.rb

Rails.application.routes.draw do
  root 'api_test#index'

  get 'api_test/index'
  get 'api_test/show/:id', to: 'api_test#show', as: 'api_test_show'
end
