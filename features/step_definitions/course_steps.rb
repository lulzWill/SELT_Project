Given /^ I am on the admin home page$/ do
   visit courses_path 
end

When /^I have added a course with name "(.*?)" and year_restrictions "(.*?)" and course_number "(.*?)" and description "(.*?)"$/ do |name, year_restrictions, course_number, description|
    visit new_course_path
    fill_in 'name', with => name
    fill_in 'year_restrictions', with => year_restrictions
    fill_in 'course_number', with => course_number
    fill_in 'description', with => description
    click_button 'Save Course'
end

Then /^I should see a course list entry with name "(.*?)" and course_number "(.*?)"$/ do |name, course_number|
    result = false
    
    all("tr").each do |tr|
        if tr.has_content?(name) && tr.has_content?(course_number)
            result = true
            break
        end   
    end 
    
    expect(result).to be_truthy
end    