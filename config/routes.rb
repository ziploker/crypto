Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'landing#index'

get '/market', to: 'home#index', as: 'market'

#create
post '/porfolio', to: 'porfolio#buy'

#new
get '/porfolio/trade', to: 'porfolio#trade'

#index
get '/porfolio', to: 'porfolio#myporfolio'

#show
get '/porfolio/:id', to: 'porfolio#show', as: 'show'

patch '/porfolio/:id', to: 'porfolio#update', as: 'wallet'

get '/porfolio/:id/edit', to: 'porfolio#edit', as: 'edit'

#post '/porfolio/new', controller: 'porfolio', action: 'create'


#POST '/powfolio/myporfolio(.:format)' =>  'porfolio#create'

#resources :porfolio

get '/battle', to: 'battle#starter'

post '/battle', to: 'battle#create', as: 'starter'

post '/', to: 'home#index'







end
