class AddSemesterHoursToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :semester_hours, :integer
  end
end
