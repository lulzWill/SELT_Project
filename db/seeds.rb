# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = [{:name => 'Underwater Basket Weaving', :year_restrictions => 'None', :course_number => '1', :descrition => 'You learn to weave baskets underwater.', :semester_hours => 3},
           {:name => 'Living a Life', :year_restrictions => 'None', :course_number => '2', :descrition => 'You learn to live.', :semester_hours => 4}
          ]

courses.each do |course|
   Course.create!(course) 
end    

users = [{:email => 'a@.com', :user_id => 'admin', :password => 'password', :role => 'admin', :year => '4'},
         {:email => 'student@student.com', :user_id => 'student', :password => 'password', :role => 'stduent', :year => '4'},
         {:email => 'professor@professor.com', :user_id => 'professor', :password => 'password', :role => 'professor', :year => '4'}
        ]
    
users.each do |user|
    User.create!(user)
end    