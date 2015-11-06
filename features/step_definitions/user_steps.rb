When /^I have successfully signed up as a "(.*?)"$/ do |position|
  visit new_user_path
  fill_in 'signup_email', :with => "fake@fake.com"
  fill_in 'signup_id', :with => "fake_user"
  fill_in 'signup_pass', :with => "fake"
  fill_in 'signup_pass_conf', :with => "fake"
  select position, :from => 'user_role'
  click_button 'signup_submit'
end

When /^I have filled out the sign up form with mismatching passwords$/ do
  visit new_user_path
  fill_in 'signup_email', :with => "fake@fake.com"
  fill_in 'signup_id', :with => "fake_user"
  fill_in 'signup_pass', :with => "fakefake"
  fill_in 'signup_pass_conf', :with => "fakefaker"
  select 'Student', :from => 'user_role'
  click_button 'signup_submit'
end

When /^I have filled out the sign up form with an incorrect validation code$/ do
  visit new_user_path
  fill_in 'signup_email', :with => "fake@fake.com"
  fill_in 'signup_id', :with => "fake_user"
  fill_in 'signup_pass', :with => "fakefake"
  fill_in 'signup_pass_conf', :with => "fakefake"
  select 'Teacher', :from => 'user_role'
  fill_in 'signup_validate', :with => "wrong"
  click_button 'signup_submit'
end

When /^I have filled out the sign up form with a bad email$/ do
  visit new_user_path
  fill_in 'signup_email', :with => "fake"
  fill_in 'signup_id', :with => "fake_user"
  fill_in 'signup_pass', :with => "fakefake"
  fill_in 'signup_pass_conf', :with => "fakefake"
  select 'Student', :from => 'user_role'
  click_button 'signup_submit'
end

When /^I have filled out the sign up form with a short password$/ do
  visit new_user_path
  fill_in 'signup_email', :with => "fake"
  fill_in 'signup_id', :with => "fake_user"
  fill_in 'signup_pass', :with => "fake"
  fill_in 'signup_pass_conf', :with => "fake"
  select 'Student', :from => 'user_role'
  click_button 'signup_submit'
end

When /^I have filled out the sign up form with a long password$/ do
  visit new_user_path
  fill_in 'signup_email', :with => "fake"
  fill_in 'signup_id', :with => "fake_user"
  fill_in 'signup_pass', :with => "fakelongpasswordsarebad"
  fill_in 'signup_pass_conf', :with => "fakelongpasswordsarebad"
  select 'Student', :from => 'user_role'
  click_button 'signup_submit'
end

Then /^I should be shown "(.*?)" confirmation on the homepage$/ do |position|
  expect(page.text).to match(/You have successfully signed up as a #{position}/)
end

Then /^I should be shown an error message$/ do
  expect(page.text).to match(/ERROR:/)
end