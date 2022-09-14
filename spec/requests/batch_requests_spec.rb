require 'rails_helper'

RSpec.describe 'BatchesController', type: :request do
  before(:all) do
    @order = FactoryBot.create_list(:order, 5)
  end
  describe 'POST /batches' do
    it 'works.' do
      valid_params = FactoryBot.attributes_for(:order)
      post '/batches', params: { purchase_channel: valid_params[:purchase_channel] }
      expect(response).to have_http_status(200)
    end

    it 'not works.' do
      invalid_params = FactoryBot.attributes_for(:order, purchase_channel: nil)
      post '/batches', params: { purchase_channel: invalid_params[:purchase_channel] }
      expect(response).to have_http_status(420)
    end
  end
end
