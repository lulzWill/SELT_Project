Given /"(.*?)" is on the "(.*?)" grades page for "(.*?)"/ do |user, assignment, course|
  #ask ryan about index pathing
  aid = Assignment.find_by_name(assignment).id
  cid = Course.find_by_course_number(course).id
  visit "/#{cid}/#{aid}/grades"
end

Given /"(.*?)" is logged in with password "(.*?)"/ do |id, password|
    visit login_path
    fill_in 'user_id', :with => id
    fill_in 'password', :with => password
    click_button 'Log in'
end

Given /User "(.*?)" has been added to "(.*?)"/ do |user, course|
    u = User.find_by_user_id(user)
    c =  Course.find_by_course_number(course)
    u.courses << c
    c.users << u
end

Given /Assignment "(.*?)" has been added to "(.*?)"/ do |assignment, course|
    a = Assignment.find_by_name(assignment)
    c =  Course.find_by_course_number(course)
    c.assignments << a
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

When /I add a grade with "(.*?)" points for "(.*?)"/ do |points, user|
    fill_in 'grade[' + user + ']', :with => points
    click_button 'Add Grades'
end

When /I add multiple grades with "(.*?)" points for "(.*?)" and "(.*?)" points for "(.*?)"/ do |points1, user1, points2, user2|
    fill_in 'grade[' + user1 + ']', :with => points1
    fill_in 'grade[' + user2 + ']', :with => points2
    click_button 'Add Grades'
end

Then /I should be able to see the average score of "(.*?)" on the "(.*?)" page/ do |average, assignment|
    expect(page.text).to match(/Average score for #{assignment}: #{average}/)
end