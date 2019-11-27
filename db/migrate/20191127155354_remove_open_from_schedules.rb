class RemoveOpenFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :open
  end
end
