Rails.application.routes.draw do
  resources :batches
  resources :orders

  get '/purchase_channel', to: 'orders#purchase_channel'
  get '/client', to: 'orders#client'
  get '/financial_report', to: 'financial#create'

  post '/produce', to: 'batches#produce_batch'
  post '/mark_sent', to: 'batches#mark_as_sent'
end
