class Schedule < ApplicationRecord
  belongs_to :truck
  validates :day, uniqueness: true, inclusion:
  { in:
    [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ] }
  validates :open, presence: true
  validates :location, presence: true, if :open?
  validates :start_time, presence: true, if :open?
  validates :end_time, presence: true, if :open?
  validates_time :end_time, on_or_after: :start_time

  def open?
    @schedule.open
  end
end
