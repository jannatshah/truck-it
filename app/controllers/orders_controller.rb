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

  # def create
  #   @order = Order.new(order_params)
  #   @order.user = current_user
  #   if @order.save
  #     redirect_to order_path(@order)
  #   else
  #     render :new
  #   end


  # end

  def confirmation
    @order = Order.find(params[:id])
  end

  def create_session
    @order = Order.find(params[:id])
    line_items = []
    amount = 0
    @order.selections.each do |selection|
      purchase = {}
      purchase[:name] = selection.dish.name
      purchase[:amount] = selection.dish.price_cents
      purchase[:currency] = 'gbp'
      purchase[:quantity] = 1
      amount += selection.dish.price_cents / 100.0
      line_items << purchase
    end
    # binding.pry

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,

      success_url: confirmation_order_url(@order),
      cancel_url: confirmation_order_url(@order)
    )
    @order.update(checkout_session_id: session.id, amount: amount)
    redirect_to new_order_payment_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end
end
