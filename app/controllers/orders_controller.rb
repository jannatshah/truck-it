class OrdersController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end
end
