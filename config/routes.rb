Rails.application.routes.draw do
  
  
devise_for :users
  

root 'landing#index'

resources :battles
resources :wallets


get '/markets', to: 'markets#index', as: 'market'

patch '/room/:id', to: 'wallets#updateRoom', as: 'room'

post '/', to: 'markets#index'


get '/refresh', to: 'battles#refresh'




end
