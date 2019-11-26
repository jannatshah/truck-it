class AddCoordinatesToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :latitude, :float
    add_column :schedules, :longitude, :float
  end
end
