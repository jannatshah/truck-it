class SelectionsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create, :destroy, :destroy_from_order]

  def create
    @selection = Selection.create(selection_params)
    @dish = @selection.dish
  end

  def destroy
    @selection = Selection.find(params[:id])
    @dish = @selection.dish
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to truck_path(@dish.truck) }
      format.js
    end
  end

  def destroy_from_order
    @selection = Selection.find(params[:id])
    @dish = @selection.dish
    @selection.destroy
    redirect_to order_path(@selection.order)
  end

  private

  def selection_params
    params.permit(:dish_id, :order_id)
  end

  def set_order
    @order = Order.find(params[:order_id])
  end
end
