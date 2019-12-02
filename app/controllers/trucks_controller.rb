class TrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_truck, only: %i[show edit update destroy]

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
  end

  def show
    authorize @truck
    @trucks = policy_scope(Truck)
    @schedules = @trucks.map { |truck| truck.schedules }.flatten
    @markers = @schedules.select { |schedule| Date::DAYNAMES.index(schedule.day) == Date.today.wday }.map { |s|
      {
        lat: s.latitude,
        lng: s.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { s: s }),
        image_url: helpers.asset_url('truck_icon.png')
      }}
      # @schedule = Schedule.find([:id])
      today = Date.today.strftime("%A")
      schedule = Schedule.where(day: today).first
      @schedule = Schedule.find(schedule[:id])


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

  private

  def find_truck
    @truck = Truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:name, :description, :category, :photo, :card)
  end

  def schedule_params
    params.require(:schedule).permit(:truck_id, :day, :open, :location, :start_time, :end_time)
  end
end
