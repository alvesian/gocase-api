require 'rails_helper'

RSpec.describe 'OrdersController', type: :request do
  before(:all) do
    @order = FactoryBot.create(:order)
  end

  describe 'GET /purchase_channel' do
    it 'works.' do
      get purchase_channel_path(purchase_channel: @order.purchase_channel, status: @order.status)
      expect(response).to have_http_status(200)
    end

    it 'not works, missing one parameter.' do
      get purchase_channel_path(purchase_channel: @order.purchase_channel)
      expect(response).to have_http_status(420)
    end

    it 'not works.' do
      get purchase_channel_path
      expect(response).to have_http_status(420)
    end
  end
end
