class Course < ActiveRecord::Base
   has_many :assignments
   has_and_belongs_to_many :users
   
   validates :name, :presence => true, :uniqueness => true
   validates :year_restrictions, :presence => true
   validates :course_number, :presence => true, :uniqueness => true 
   
   def self.search(search)
      if search
         where('name LIKE ?', "%#{search}%")
      end
   end   
end    