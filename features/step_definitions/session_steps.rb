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

Then /^I should be logged in as "(.*?)"$/ do |role|
    #expect(page.text).to match(/Invalid/)
    expect(page.text).to match(/You have successfully logged in as #{role}/)
    #expect(current_url).to match(courses_path)
end
    
Then /^I should be redirected to login path$/ do
    expect(current_url).to match(login_path)
end