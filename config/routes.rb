Rails.application.routes.draw do
  root 'api_test#index'
 
  
  get '/api_test/index', to: 'api_test#index' 
  get '/api_test/platforms_list', to: 'api_test#platforms_list'
  get '/api_test/show/:title', to: 'api_test#show', as: 'api_test_show'
  get '/api_test/creators_list', to: 'api_test#creators_list'
end
