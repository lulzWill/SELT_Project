class Assignment < ActiveRecord::Base
    belongs_to :courses
    serialize :grades, Hash
end    