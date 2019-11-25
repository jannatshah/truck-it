class TrucksController < ApplicationController
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
    # IF LOGIC WHEN WE HAVE VIEWS
  end

  def edit
  end

  def update
    @truck.update(truck_params)
    # IF LOGIC WHEN WE HAVE VIEWS
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
