class AddSeatsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :seats, :integer
  end
end
