class Assignment < ActiveRecord::Base
    belongs_to :course, foreign_key: 'course'
end    