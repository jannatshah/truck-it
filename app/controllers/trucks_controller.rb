class TrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_truck, only: %i[show edit update destroy]
  before_action :set_trucks, only: %i[chinese indian thai mexican lebanese italian kebabs hot_dogs ice_cream donuts pancakes brazilian tapas]
  before_action :markers, only: %i[chinese indian thai mexican lebanese italian kebabs hot_dogs ice_cream donuts pancakes brazilian tapas]
  def index
    @trucks = policy_scope(Truck)
    @schedules = @trucks.map { |truck| truck.schedules }.flatten
    @markers = @schedules.select { |schedule| Date::DAYNAMES.index(schedule.day) == Date.today.wday }.map { |s|
      {
        lat: s.latitude,
        lng: s.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { s: s }),
        image_url: helpers.asset_url('truck_icon.png')
      }}
    # @markers = @trucks.map do |truck|
    #   {
    #     lat: s.latitude,
    #     lng: s.longitude
    #   }
    # end
    # raise
  end

  def chinese
  end

  def indian
  end

  def thai
  end

  def mexican
  end

  def lebanese
  end

  def italian
  end

  def kebabs
  end

  def burgers
  end

  def hot_dogs
  end

  def ice_cream
    # raise
  end

  def donuts
  end

  def pancakes
  end

  def brazilian
  end

  def tapas
  end

  def show
    authorize @truck
    @review = Review.new

    @trucks = policy_scope(Truck)
    @schedules = @trucks.map { |truck| truck.schedules }.flatten
    @markers = @schedules.select { |schedule| Date::DAYNAMES.index(schedule.day) == Date.today.wday }.map { |s|
      {
        lat: s.latitude,
        lng: s.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { s: s }),
        image_url: helpers.asset_url('truck_icon.png')
      }
    }
    # @schedule = Schedule.find([:id])
    today = Date.today.strftime("%A")
    @schedule = @truck.schedules.where(day: today).last

    @schedule = @truck.schedules.last if @schedule.nil?
    # @schedule = Schedule.find(schedule[:id])
    # @dishes = @truck.dishes unless @truck.dishes.nil?
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
    @schedule = Schedule.new
    @schedule.truck = @truck
    @dish = Dish.new
    @dish.truck = @truck
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
    authorize @truck
    @truck.destroy
    redirect_to root_path
  end

  def truck_orders
    @truck = Truck.find(params[:truck_id])
    authorize @truck
    all_truck_orders = []
    @dishes = @truck.dishes
    @dishes.each do |dish|
      @orders = dish.orders
      @orders.each do |order|
        all_truck_orders << order
      end
    end
    return all_truck_orders
  end

  private

  def find_truck
    @truck = Truck.find(params[:id])
  end

  def set_trucks
    @trucks = policy_scope(Truck).where('category ILIKE ?', "%#{action_name}%")
    authorize @trucks
  end

  def markers
    @schedules = @trucks.map { |truck| truck.schedules }.flatten
    @markers = @schedules.select { |schedule| Date::DAYNAMES.index(schedule.day) == Date.today.wday }.map { |s|
      {
        lat: s.latitude,
        lng: s.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { s: s }),
        image_url: helpers.asset_url('truck_icon.png')
      }}
  end

  def truck_params
    params.require(:truck).permit(:name, :description, :category, :photo, :card)
  end

  def schedule_params
    params.require(:schedule).permit(:truck_id, :day, :open, :location, :start_time, :end_time)
  end
end
