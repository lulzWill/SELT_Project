When /^I have signed up as a "(.*?)"$/ do |position|
  visit new_user_path
  fill_in 'Email', :with => "fake@fake.com"
  fill_in 'Password', :with => "fake"
  select position, :from => 'Positions'
  click_button 'Sign Up'
end
 
Then /^I should be directed to the "(.*?)" landing homepage$/ do |position|
    expect(page.text).to match(/You are currently logged in as a {position}/)
end