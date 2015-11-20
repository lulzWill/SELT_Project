class Course < ActiveRecord::Base
   has_many :assignments
   belongs_to :user
   
   validates :name, :presence => true, :uniqueness => true
   validates :year_restrictions, :presence => true
   validates :course_number, :presence => true, :uniqueness => true 
   
end    