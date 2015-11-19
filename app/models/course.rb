class Course < ActiveRecord::Base
   has_many :appointments
   belongs_to :user
end    