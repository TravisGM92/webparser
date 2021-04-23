Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/supplements', to: 'supplements#index'
  post '/supplements', to: 'supplements#show'
  get '/test', to: 'supplements#test'
end
