Given /^I am on the teacher homepage$/ do
  #ask ryan about index pathing
end

Given /the following users have been added to the database:/ do |users_table|
    users_table.hashes.each do |user|
        User.create(user)
    end
end

Given /the following courses have been added to the database:/ do |courses_table|
    courses_table.hashes.each do |course|
        Course.create(course)
    end
end

Given /the following assignments have been added to the database:/ do |assignments_table|
    assignments_table.hashes.each do |assignment|
        Assignment.create(assignment)
    end
end

Then /I should be redirected to the assignment page with a "(.*?)" message/ do |message|
    expect(page.text).to match(/#{message}/)
end

When /I have filled out the form for "(.*?)" students at once/ do |times|
    visit new_grade_path
    fill_in 'points_1', :with => '5'
    select 'user1', :from => 'student_list_1'
    click_button 'add_additional'
    fill_in 'points_2', :with => '8'
    select 'user1', :from => 'student_list_2'
    click_button 'add_grades'
end

When /I add a grade with "(.*?)" points/ do |points|
    visit new_grade_path
    fill_in 'points', :with => points
    select 'user1', :from => 'student_list'
    click_button 'add_grades'
end
