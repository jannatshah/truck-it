class TrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_truck, only: %i[show edit update destroy]

  def index
    @trucks = policy_scope(Truck)
  end

  def show
  end

  def new
    @truck = Truck.new
    authorize @truck
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user = current_user
    authorize @truck
    # IF LOGIC WHEN WE HAVE VIEWS
    if @truck.save
      redirect_to @truck
    else
      render :new
    end
  end

  def edit
    authorize @truck
  end

  def update
    @truck.update(truck_params)
    authorize @truck
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
