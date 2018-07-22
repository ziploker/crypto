Rails.application.routes.draw do
  
  
devise_for :users
  

root 'landing#index'

resources :battles
resources :wallets

get '/markets/:room', to: 'markets#index', as: 'mymarket'
get '/markets', to: 'markets#index', as: 'market'

patch '/room/:id', to: 'wallets#updateRoom', as: 'room'

post '/', to: 'markets#index'





end
