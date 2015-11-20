Given /^the following courses have been added to the table$/ do |courses_table|
  courses_table.hashes.each do |course|
    Assignment.create(:name => course[:name])
  end
end

Given /^the following assignments have been added to the table$/ do |assignments_table|
  assignments_table.hashes.each do |assign|
    Assignment.create(:course_id => assign[:course_id], :name => assign[:name], :points => assign[:points])
  end
end

Given /^the following assignments have been added to the table for the course name "(.*?)"$/ do |courseName, assignments_table|
  #course = Course.find_by(name: courseName)
  #courseId = course.id
  assignments_table.hashes.each do |assign|
    Assignment.create(:course_id => 1, :name => assign[:name], :points => assign[:points])
  end
end

Given /^I am on the assignments page with course by the name of "(.*?)"$/ do |name|
    #visit assignments_home_path(:courseId => Assignment.find_by(name: name).id)
    #visit assignments_home_path(:courseId => 1)
    visit courses_path
    click_link("More about #{name}")
    click_button('Assignments')
end

When /^I have entered the name "(.*?)" with "(.*?)" points and clicked create assignment$/ do |name,points|
    #ill_in 'createName', :with => name
    #fill_in 'createPoints', :with => points.to_i
    puts page.current_path
    click_button('Create Assignment')
end

Then /^I should see an assignment in the table that has the name "(.*?)" and it should have "(.*?)" points$/ do |name,points|
  expect(page).to have_content(name)
  expect(page).to have_content(points)
end

Then /^I should NOT see an assignment with the name "(.*?)" in the table$/ do |name|
  expect(page).to_not have_content(name)
  expect(page).to_not have_content(points)
end

When /^I have clicked to delete the assignment by the name of "(.*?)"$/ do |name|
  count = 1
  column = 0
  all('//tbody/tr/td[1]').each do |assignName|
    if name == assignName
      column = count
    end
    count = count + 1 
  end
  within('//tbody/tr[' + column +']/td[4]') do
    click_button('Delete Assignment')
  end
end

When /^I have updated the assignment with the name "(.*?)" to "(.*?)" and change the points to "(.*?)"$/ do |name1, name2, points2|
  count = 1
  column = 0
  all('//tbody/tr/td[1]').each do |assignName|
    if name1 == assignName
      column = count
    end
    count = count + 1 
  end
  within('//tbody/tr[#{column}]/td[3]') do
    
  end
  fill_in 'updateName', :with => name2
  fill_in 'updatePoints', :with => points2
  #find('#updateName').val(assignName).set("");
  #find(xpath'#updatePoints').val(parseInt(assignPoints));
  click_button('Save')
end

When /^I click view grades on an assignment$/ do
    click_button('View Grades')
end

Then /^I should be redirected to the grades page$/ do
    if(page.current_path == grades_path)
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