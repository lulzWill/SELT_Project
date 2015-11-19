# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

<<<<<<< HEAD
courses = [{:name => 'Philosophy', :year_restrictions => 'freshman', :course_number => "1"},
            {:name => 'Calculus', :year_restrictions => 'freshman', :course_number => "2"},
            {:name => 'Anatomy', :year_restrictions => 'freshman', :course_number => "3"},
            {:name => 'Biology', :year_restrictions => 'freshman', :course_number => "4"},
            {:name => 'SELT', :year_restrictions => 'freshman', :course_number => "5"},
            {:name => 'Algorithms', :year_restrictions => 'freshman', :course_number => "6"},
            {:name => 'Cooking', :year_restrictions => 'freshman', :course_number => "7"},
            {:name => 'Advanced Napping', :year_restrictions => 'freshman', :course_number => "8"}]
            
courses.each do |course|
    Course.create!(course)
end

users = [{:user_id => 'Student', :email => 'student@email.com', :password => 'password', :role => 'Student', :year => 'freshman'},
            {:user_id => 'Professor', :email => 'prof@email.com', :password => 'password', :role => 'Professor', :year => ' '},
            {:user_id => 'Admin', :email => 'admin@email.com', :password => 'password', :role => 'Admin', :year => ' '}]
            
users.each do |user|
    User.create!(user)
end

