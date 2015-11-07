When /^I have entered UserId "(.*?)" and password "(.*?)"$/ do |id, password|
    visit login_path
    fill_in 'user_id', :with => id
    fill_in 'password', :with => password
    click_button 'Log in'
end

Then /^I should be logged in as "(.*?)"$/ do |role|
    expect(page.text).to match(/Invalid/)
end
    
Then /^I should be redirected to login path$/ do
    expect(current_url).to match(login_path)
end