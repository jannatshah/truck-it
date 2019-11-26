class TrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_truck, only: %i[show edit update destroy]

  def index
    @trucks = Truck.all
  end

  def show
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user = current_user
    # IF LOGIC WHEN WE HAVE VIEWS
    if @truck.save
      redirect_to @truck
    else
      render :new
    end
  end

  def edit
  end

  def update
    @truck.update(truck_params)
    # IF LOGIC WHEN WE HAVE VIEWS
    if @truck.save
      redirect_to @truck
    else
      render :edit
    end
  end

  def destroy
    @truck.destroy
    redirect_to root_path
  end

  private

  def find_truck
    @truck = Truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:name, :description, :category)
  end
end
