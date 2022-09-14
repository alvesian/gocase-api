require 'rails_helper'

RSpec.describe 'BatchesController', type: :request do
  before(:all) do
    @order = FactoryBot.create_list(:order, 5)
  end
  describe 'POST /produce' do
    it 'works.' do
      valid_params = FactoryBot.attributes_for(:order)
      post '/batches', params: { purchase_channel: valid_params[:purchase_channel] }
      batch = JSON.parse response.body
      post '/produce', params: { reference: batch['reference'] }
      expect(response).to have_http_status(200)
    end

    it 'not works.' do
      valid_params = FactoryBot.attributes_for(:order)
      post '/batches', params: { purchase_channel: valid_params[:purchase_channel] }
      post '/produce', params: { reference: nil }
      expect(response).to have_http_status(420)
    end

    it 'not works with invalid number.' do
      valid_params = FactoryBot.attributes_for(:order)
      post '/batches', params: { purchase_channel: valid_params[:purchase_channel] }
      post '/produce', params: { reference: 'QWENOI22-11' }
      expect(response).to have_http_status(420)
    end
  end
end
