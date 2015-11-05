class Grade < ActiveRecord::Base
    has_one :assignment, foreign_key: 'assignment'
    has_one :user, foreign_key: 'student'
end    