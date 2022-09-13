class OrdersController < ApplicationController
  def create
    @order = Order.create(order_params)

    if @order.id.nil?
      render json: { message: 'The order was not created!', errors: @order.errors }, status: 420
    else
      render json: { message: 'The order was created!', order: @order }
    end
  end

  def index
    order = Order.where(order_params).order(id: :desc)

    if order[0].nil?
      render json: { message: 'No orders was found!' }
    else
      render json: order
    end
  end

  def purchase_channel
    order = Order.where(purchase_channel: params[:purchase_channel], status: params[:status]).order(id: :desc)

    if order[0].nil?
      render json: { message: 'No orders was found! Check your parameters.' }, status: 420
    else
      render json: order
    end
  end

  def client
    order = Order.where(client_name: params[:client_name]).order(id: :desc)

    if order[0].nil?
      render json: { message: 'No orders was found! Check your parameters.' }, status: 420
    else
      render json: order
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end


  private

  def order_params
    params.permit(:reference, :purchase_channel, :client_name, :address,
                  :delivery_service, :total_value, :line_items, :status)
  end
end
