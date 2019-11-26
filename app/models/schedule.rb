class Schedule < ApplicationRecord
  belongs_to :truck
  validates :day, uniqueness: { scope: :truck }, inclusion: { in: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'] }
  validates :open, presence: true
  validates :location, presence: true if :open?
  validates :start_time, presence: true if :open?
  validates :end_time, presence: true if :open?
  validates_time :end_time, on_or_after: :start_time

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def open?
    @schedule.open
  end
end
