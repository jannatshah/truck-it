class DishesController < ApplicationController
  before_action :set_truck
  before_action :find_dish, only: %i[edit update destroy]
  skip_after_action :verify_authorized

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.truck = @truck
    if @dish.save
      diet_ids = params["dish"]["diet_ids"].reject(&:empty?)
      diet_ids.each do |diet_id|
        DishDiet.create(dish: @dish, diet: Diet.find(diet_id))
      end
      redirect_to truck_path(@truck)
    else render :new
    end
  end

  def edit
  end

  def update
    @dish.update(dish_params)
    if @dish.save
      redirect_to truck_path(@truck)
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    @truck = @dish.truck
    redirect_to truck_path(@truck)
  end

  private

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :price, :diet_ids)
  end

  def find_dish
    @dish = Dish.find(params[:id])
  end
end
