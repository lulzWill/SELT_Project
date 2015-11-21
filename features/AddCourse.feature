Feature: Allow admin user to add a new course
  
Background: user in the user table 
  
  Given the following users have been added to the table 
  |user_id|password_digest|role   |
  |admin  |admin1         |admin  | 
  
  And "admin" is logged in with password "admin1"
  And "admin" is on the courses page
  
Scenario: Add a course with valid params
    When I have entered a course with name "Rails" and year_restrictions "none" and course_number "356" and description "Learn to program rails"
    Then I should see a course list entry with title "Rails" and course_number "356" 