Given /the following users have been added to the table/ do |users_table|
  users_table.hashes.each do |user|
    User.create(:user_id=>user[:user_id], :password=>user[:password_digest], :role=>user[:role])
  end
end
When /^I have entered UserId "(.*?)" and password "(.*?)"$/ do |id, password|
    visit login_path
    fill_in 'user_id', :with => id
    fill_in 'password', :with => password
    click_button 'Log in'
end

Then /^I should be logged in as "(.*?)"$/ do |id|
    #expect(page.text).to match(/Invalid/)
    expect(page.text).to match(/You have successfully logged in as #{id}/)
    #expect(current_url).to match(courses_path)
end
    
Then /^I should be redirected to login path$/ do
    expect(current_url).to match(login_path)
end

When /^I have not logged in$/ do
    visit login_path
    click_link 'SELT_Project'
end

Then /^redirect to login_path$/ do
    expect(current_url).to match(login_path)
end

When /^I am logged in$/ do 
  visit login_path
  fill_in 'user_id', :with => 'student'
  fill_in 'password', :with => 'student'
  click_button 'Log in'
  click_link 'SELT_Project'
end

Then /^redirect to courses_path$/ do
  expect(current_url).to match(courses_path)
end

When /^I click on logout button when logged in$/ do
  visit login_path
  fill_in 'user_id', :with => 'student'
  fill_in 'password', :with => 'student'
  click_button 'Log in'
  click_button 'Log Out'
end

Then /^redirect to login_path and display logout message$/ do
  expect(current_url).to match(login_path)
  expect(page.text).to match(/You have logged out/)
end

When /^I am logged in "(.*?)" and click on link in navbar$/ do |id|
  visit login_path
  fill_in 'user_id', :with => 'student'
  fill_in 'password', :with => 'student'
  click_button 'Log in'
  click_button 'Log Out'
  #fill_in 'user_id', :with => 'student'
  #fill_in 'password', :with => 'student'
  fill_in 'user_id_nav', :with => id
  fill_in 'password_nav', :with => id
  click_button 'Login'
  click_link 'profile'
end

Then /^I should be redirected to "(.*?)" profile$/ do |id|
  expect(current_url).to match(home_path)
end