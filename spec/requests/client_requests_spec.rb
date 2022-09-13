require 'rails_helper'

RSpec.describe 'OrdersController', type: :request do
  before(:all) do
    @order = FactoryBot.create(:order)
  end

  describe 'GET /client' do
    it 'works.' do
      get client_path(client_name: @order.client_name)
      expect(response).to have_http_status(200)
    end

    it 'not works.' do
      get client_path
      expect(response).to have_http_status(420)
    end
  end
end
