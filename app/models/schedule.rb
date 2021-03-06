class Schedule < ActiveRecord::Base
  belongs_to :room
  belongs_to :course
  belongs_to :time_slot

  validate :room_available, on: :create
  validates_presence_of :room_id, :course_id, :start_date, :end_date, :time_slot_id

  scope :current, -> { where('start_date <= :today AND end_date >= :today', today: Date.today) }

  def slotcode
    TimeSlot.find(self.time_slot_id).slotcode
  end

  def print_times
    self.time_slot.print_times
  end
  
  private
  def room_available
    query = Schedule.where(['
      (room_id=:room_id AND time_slot_id=:time_slot) and
      (
        (start_date < :start_date AND end_date > :end_date)
        OR (start_date < :end_date AND end_date > :start_date)
        OR (start_date > :start_date AND end_date < :end_date)
        OR (start_date > :end_date AND end_date < :start_date)
      )', 
      room_id: room_id, start_date: start_date, end_date: end_date, 
      time_slot: time_slot_id])
    if query.count > 0
      errors.add(:base, 'The dates you have selected are overlapping with other schedules.')
    end
  end

end
