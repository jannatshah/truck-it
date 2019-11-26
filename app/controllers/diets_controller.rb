class DietsController < ApplicationController
  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new(diet_params)
  end

  private

  def diet_params
    params.require(:diet).permit(:requirement)
  end
end
