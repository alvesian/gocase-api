Rails.application.routes.draw do
  resources :batches
  resources :orders

  get '/purchase_channel', to: 'orders#purchase_channel'
  get '/client', to: 'orders#client'
end
