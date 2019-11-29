class SelectionsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create, :destroy]

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

  private

  def selection_params
    params.permit(:dish_id, :order_id)
  end
end
