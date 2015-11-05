class Course < ActiveRecord::Base
   has_and_belongs_to_many :user, foreign_key: 'student'
   has_one :user, foreign_key: 'professor'
   has_one :user, foreign_key: 'TA'
   has_many :assignment, foreign_key: 'assignment'
end    