FactoryGirl.define do
  factory :course do
    # id 1 
    name "Course1"
    year_restrictions "0"
    course_number "1"
    description "a course"
    semester_hours 4
  end
  
  factory :invalid_course, :class => "Course" do
    # id 1 
    name "Course1"
    year_restrictions nil
    course_number "4"
    description "a course"
    semester_hours 4
  end

end