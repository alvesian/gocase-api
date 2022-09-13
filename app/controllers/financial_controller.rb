class FinancialController < ApplicationController
  def create
    @orders = Order.where(purchase_channel: params[:purchase_channel])
    total_value = @orders.sum(:total_value)
    number_of_orders = @orders.count
    render json: { purchase_channel: params[:purchase_channel],
                   total_value: total_value,
                   number_of_orders: number_of_orders }
  end
end