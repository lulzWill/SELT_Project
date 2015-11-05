class Assignment < ActiveRecord::Base
    has_one :course, foreign_key: 'course'
end    