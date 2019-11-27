class SchedulesController < ApplicationController
  before_action :find_truck
  skip_after_action :verify_authorized

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.truck = @truck
    # IF SAVE LOGIC
    if @schedule.save
      redirect_to @truck
    else
      # redirect_to edit_truck_path(@truck)
      render 'trucks/edit'
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @truck = @schedule.truck
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    # IF SAVE LOGIC
    @schedule.save
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :open, :location, :start_time, :end_time)
  end

  def find_truck
    @truck = Truck.find(params[:truck_id])
  end
end
