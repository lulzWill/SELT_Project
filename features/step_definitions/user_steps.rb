When /^I have successfully signed up as a "(.*?)"$/ do |position|
  visit new_user_path
  fill_in 'Email', :with => "fake@fake.com"
  fill_in 'UserId', :with => "fake_user"
  fill_in 'Password', :with => "fake"
  select position, :from => 'Positions'
  click_button 'Sign Up'
end

Then /^I should be shown "(.*?)" confirmation on the homepage$/ do |position|
    expect(page.text).to match(/You have successfully up as a #{position}/)
end