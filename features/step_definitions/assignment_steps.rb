Given /^the following assignments have been added to the table$/ do |assignments_table|
  assignments_table.hashes.each do |assign|
    Assignment.create(:course_id=> assign[:course_id], :name=> assign[:name], :points=> assign[:points])
  end
end

Given /^the following assignments have been added to the table for the course name "(.*?)"$/ do |courseName, assignments_table|
  course = Course.where(name: courseName).take
  id = course.id
  assignments_table.hashes.each do |assign|
    Assignment.create(:course_id=> id, :name=> assign[:name], :points=> assign[:points])
  end
end

Given /^I am on the assignments page$/ do
    redirect_to assignments_home
end

When /^I have entered the name "(.*?)" with "(.*?)" points and clicked create assignment$/ do |name,points|
    fill_in 'createName', :with => name
    fill_in 'createPoints', :with => points.to_i
    click_button('Create Assignment')
end

Then /^I should see an assignment in the table that has the name "(.*?)" and it should have "(.*?)" points$/ do |name,points|
    
end

Then /^I should NOT see an assignment with the name "(.*?)" in the table$/ do |name|
    
end

When /^I have clicked to delete the assignment by the name of "(.*?)"$/ do |name|
    
end

When /^I have updated the assignment with the name "(.*?)" to "(.*?)" and change the points to "(.*?)"$/ do |name1, name2, points2|
    
end

When /^I click view grades on an assignment$/ do
    click_button('View Grades')
end

Then /^I should be redirected to the grades page$/ do
    
end

Then /^I should see a flash message saying "(.*?)"$/ do |message|

end

Then /^I should see the message "(.*?)" in the first table row$/ do |message|

end