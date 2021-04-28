Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/supplements', to: 'supplements#index'
  post '/supplements', to: 'supplements#show'
  get '/test', to: 'supplements#test'
  post '/search', to: 'supplements#search'

  namespace :api do
    namespace :v1 do
      get '/supplements', to: 'supplements#index'
      get '/supplements/:id', to: 'supplements#show'
      get '/supplement/find', to: 'search#show'
      get '/categories', to: 'categories#index'
    end
  end
end
