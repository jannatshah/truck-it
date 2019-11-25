class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.string :location
      t.boolean :open
      t.references :truck, foreign_key: true

      t.timestamps
    end
  end
end
