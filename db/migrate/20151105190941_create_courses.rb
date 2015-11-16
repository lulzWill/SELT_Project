class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :year_restrictions
      t.string :course_number
      t.text :descrition
      t.integer :semester_hours
      t.timestamps
    end
  end
end
