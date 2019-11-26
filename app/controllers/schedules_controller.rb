class SchedulesController < ApplicationController
  before_action :find_truck

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.truck = @truck
    # IF SAVE LOGIC
    @schedule.save
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    # IF SAVE LOGIC
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :open, :location, :start_time, :end_time)
  end

  def find_truck
    @truck = Truck.find(params[:truck_id])
  end
end
