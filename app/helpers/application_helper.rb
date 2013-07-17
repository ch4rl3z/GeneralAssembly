module ApplicationHelper
  
  def schedules_on schedules, day
    schedules.select { |x| x.time_slot.day == 'day' }
  end

  def today
    TimeSlot.joins(:schedules).where(day: Date.today.strftime('%A')).where(
    'start_date < :today AND end_date > :today',today: Date.today)
  end

end
