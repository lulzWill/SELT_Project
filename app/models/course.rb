class Course < ActiveRecord::Base
   has_many :assignments
   has_many :users
   
   validates :name, :presence => true, :uniqueness => true
   validates :year_restrictions, :presence => true
   validates :course_number, :presence => true, :uniqueness => true 
   
end    