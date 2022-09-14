class BatchesController < ApplicationController
  def create
    @orders = Order.where(purchase_channel: params[:purchase_channel]).where(status: 0).order(:id)
    @number_of_orders = @orders.count
    if @orders.first.nil?
      render json: { message: 'ERROR: The batch was not created!' }, status: 420
    else
      @batch = Batch.create(batch_params)
      update_orders(1)
      render_json_batch
    end
  end

  def produce_batch
    @batch = Batch.where(reference: params[:reference]).first
    return render json: { message: 'ERROR: The batch was not promoted!' }, status: 420 if @batch.nil?

    @orders = Order.where(batch_id: @batch.id).order(:id)
    if @orders.first.nil?
      render json: { message: 'ERROR: The batch was not promoted!' }, status: 420
    else
      update_orders(2)
      render json: { message: 'SUCCESS! The batch was promoted to closing!' }, status: 200
    end
  end

  def render_json_batch
    render json: { message: 'SUCCESS! The batch was created!',
                   reference: @batch.reference,
                   purchase_channel: @batch.purchase_channel,
                   number_of_orders: @number_of_orders,
                   orders: @orders }, status: 200
  end

  def update_orders(status)
    @orders.each do |order|
      order.update(batch_id: @batch.id, status: status)
    end
  end

  def mark_as_sent
    @batch = Batch.where(reference: params[:batch_reference]).first
    return render json: { message: 'ERROR: The batch was not promoted!' }, status: 420 if @batch.nil?

    @orders = Order.where(delivery_service: params[:delivery_service], batch_id: @batch.id)
    if @orders.first.nil?
      render json: { message: 'ERROR: The batch was not created!' }, status: 420
    else
      @number_of_orders = @orders.count
      update_orders(3)
      @orders = Order.where(delivery_service: params[:delivery_service], batch_id: @batch.id, status: 3)
      render_batch_sent
    end
  end

  def render_batch_sent
    render json: { message: 'SUCCESS! The batch was marked as sent!',
                   reference: @batch.reference,
                   purchase_channel: @batch.purchase_channel,
                   number_of_orders: @number_of_orders,
                   orders: @orders }, status: 200
  end

  private

  def batch_params
    params.permit(:reference, :purchase_channel, :orders)
  end
end
