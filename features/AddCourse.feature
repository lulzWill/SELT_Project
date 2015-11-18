Feature: Allow admin user to add a new course
  
Background: users in the user table 
  
  Given the following users have been added to the table 
  |user_id|password_digest|role   |
  |admin  |admin1         |admin  | 
  
Scenario: Add a course (Declarative)
    When I have added a course with name "SELT" and year_restrictions "none" and course_number "356" and description "Learn to program rails"
    And I am on the course page
    Then I should see a course list entry with title "SELT" and course_number "356" 