class SelectionsController < ApplicationController
  skip_after_action :verify_authorized, only: [:create]

  def create
    @selection = Selection.create(selection_params)
  end

  private

  def selection_params
    params.permit(:dish_id, :order_id)
  end
end
