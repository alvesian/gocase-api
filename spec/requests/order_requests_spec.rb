require 'rails_helper'

RSpec.describe 'OrdersController', type: :request do
  describe 'POST /orders' do
    it 'works.' do
      post '/orders', params: FactoryBot.attributes_for(:order)
      expect(response).to have_http_status(200)
    end

    it 'not works.' do
      invalid_params = FactoryBot.attributes_for(:order, client_name: nil)
      post '/orders', params: invalid_params
      expect(response).to have_http_status(420)
    end
  end
end
