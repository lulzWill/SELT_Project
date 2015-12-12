Given /^the following courses have been added to the table$/ do |courses_table|
 Course.create(:name => "Course1", :year_restrictions => "0", :course_number => "1", :description => "a course", :semester_hours => 4)
  #courses_table.hashes.each do |course|
   #puts Course.create(:name => course[:name])
  #end
end

Given /^the following assignments have been added to the table$/ do |assignments_table|
  assignments_table.hashes.each do |assign|
    Assignment.createAssignment(assign[:course_id],assign[:name],assign[:points],nil,assign[:dueDate])
  end
end

Given /^the following assignments have been added to the table for the course name "(.*?)"$/ do |courseName, assignments_table|
  course = Course.find_by name: courseName
  courseId = course.id
  assignments_table.hashes.each do |assign|
    Assignment.createAssignment(courseId,assign[:name],assign[:points],nil,assign[:dueDate])
  end
end

Given /^I am on the assignments page with course by the name of "(.*?)"$/ do |name|
    visit assignments_home_path(:courseId => Course.find_by(name: name).id)
end

Given /^the users are enrolled in "(.*?)"$/ do |courseName|
  course = Course.find_by name: courseName
  #course = Course.find(1)
  users = User.all
  users.each do |us|
    us.courses << course
  end
end

When /^I have entered the name "(.*?)" with "(.*?)" points and clicked create assignment$/ do |name,points|

    all_titles = page.all(:fillable_field, 'title')
    all_titles.each{ |e| e.set(name) }
    all_points = page.all(:fillable_field, 'points')
    all_points.each{ |e| e.set(points.to_i) }
    fill_in 'dueDate', :with => "2015-12-23 00:00:00 UTC"

    click_button('Create Assignment')
end

Then /^I should see an assignment in the table that has the name "(.*?)" and it should have "(.*?)" points$/ do |name,points|
  expect(page).to have_content(name)
  expect(page).to have_content(points.to_i)
end

Then /^I should NOT see an assignment with the name "(.*?)" in the table$/ do |name|
  all('//tbody/tr/td[1]').each do |assignName|
    expect(name != assignName).to be_truthy
  end
  
end

When /^I have clicked to delete the assignment by the name of "(.*?)"$/ do |name|
  count = 1
  column = 0
  all('//tbody/tr/td[1]').each do |assignName|
    if name == assignName.text
      column = count
    end
    count = count + 1 
  end
  within("//tbody/tr[#{column}]/td[6]") do
    click_button('Delete Assignment')
  end
end

When /^I have updated the assignment with the name "(.*?)" to "(.*?)" and change the points to "(.*?)"$/ do |name1, name2, points2|
  count = 1
  column = 0
  all('//tbody/tr/td[1]').each do |assignName|
    if name1 == assignName.text
      column = count
    end
    count = count + 1 
  end
  within("//tbody/tr[#{column}]/td[5]") do
    click_button('Edit Assignment')
  end
    all_titles = page.all(:fillable_field, 'title')
    all_titles.each{ |e| e.set(name2) }
    all_points = page.all(:fillable_field, 'points')
    all_points.each{ |e| e.set(points2.to_i) }
    click_button('Save')
end

When /^I click view grades on an assignment$/ do
  within("//tbody/tr[1]") do
    click_button('View Grades')
  end
end

Then /^I should be redirected to the grades page$/ do
    if(page.current_path == "/1/1/grades")
        result = true
    else
        result = false
    end
    expect(result).to be_truthy 
end

Then /^I should see a flash message saying "(.*?)"$/ do |message|
  expect(page).to have_content(message)
end

Then /^I should see the message "(.*?)" in the first table row$/ do |message|
  expect(page).to have_content(message)
end