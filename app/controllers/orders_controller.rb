class OrdersController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @order = Order.find(params[:id])
    @total_price = []
    @order.selections.each do |selection|
      @total_price << selection.dish.price
    end

  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end
end
