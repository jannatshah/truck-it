class DietsController < ApplicationController
  skip_after_action :verify_authorized
  def new
    @diet = Diet.new
  end

  def create
    @diet = Diet.new(diet_params)
    if @diet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def diet_params
    params.require(:diet).permit(:requirement)
  end
end
