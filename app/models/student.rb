class Student < ActiveRecord::Base
  has_secure_password

  has_many :students_courses
  has_many :courses, through: :students_courses

  validates_presence_of :name, :address, :email
  
  def current_schedule
    (self.courses.map { |x| x.slotcodes }).flatten
  end
  
  def booked? course
    true if self.courses.include? course
  end

  def add_course course
    compare = (self.current_schedule - course.slotcodes).length
    if self.current_schedule.length != compare
      # self.course << c
      # self.balance += c.price
      # self.save
      # c.seats -= 1
      # c.save
      true
    end
    false
  end
end
