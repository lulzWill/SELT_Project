Given /^I am on the login page$/ do
    visit login_create_path
end

When /^I have entered a User-Id "(.*?)" and password "(.*?)"$/ do |id, password|
    visit login_create_path
    fill_in 'user_id', :with => id
    fill_in 'password', :with => password
    click_button 'Log in'
end

Then /^I should be logged in as a "(.*?)" with User-Id "(.*?)"&/ do |role, id|
    expect(page.text).to match(/Profile for #{role} #{id}/)
end

When /^I have entered the User-Id "(.*?)" and password "(.*?)"$/ do |id, password|
    visit login_create_path
    fill_in 'user_id', :with => id
    fill_in 'password', :with => password
    click_button 'Log in'
end

Then /^I should be logged in as the "(.*?)" with User-Id "(.*?)"&/ do |role, id|
    expect(page.text).to match(/Profile for #{role} #{id}/)
end

When /^I have entered User-Id "(.*?)" and password "(.*?)"$/ do |id, password|
    visit login_create_path
    fill_in 'user_id', :with => id
    fill_in 'password', :with => password
    click_button 'Log in'
end

Then /^I should be logged in as "(.*?)" with User-Id "(.*?)"&/ do |role, id|
    expect(page.text).to match(/Profile for #{role} #{id}/)
end

When /^I have entered this User-Id "(.*?)" and password "(.*?)"$/ do |id, password|
    visit login_create_path
    fill_in 'user_id', :with => id
    fill_in 'password', :with => password
    click_button 'Log in'
end
    
Then /^I should be redirected to login path$/ do
    expect(current_url).to match(login_path)
end