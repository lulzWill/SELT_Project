class Grade < ActiveRecord::Base
    belongs_to :assignment, foreign_key: 'assignment'
    belongs_to :user, foreign_key: 'student'
end    