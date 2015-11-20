class Grade < ActiveRecord::Base
    belongs_to :assignment, foreign_key: 'assignment'
end    