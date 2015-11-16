Feature: Allow a teacher to add grades for an assignment

Background: courses have been added to the application

  Given the following users have been added to the database:
  | email                          | user_id | role    | year     |
  | user1@user.com                 | user1   | Student | Freshman |
  | user2@user.com                 | user2   | Student | Freshman |
  
  Given the following courses have been added to the database:
  | name                          | year_restrictions | course_number |
  | Intro to Software Engineering | none              | SE:101        |
  
  Given the following assignments have been added to the database:
  | name                          | points            | order         | course |
  | Homework 1                    | 10                | none          | SE:101 |
  And  I am on the teacher homepage
  
Scenario: Adding a grade for an assignment
  When I add a grade with "5" points
  Then I should be redirected to the assignment page with a "success" message

Scenario: Adding more than one grade at once
  When I have filled out the form for "2" students at once
  Then I should be redirected to the assignment page with a "3 grades enterred" message
  
Scenario: Adding grade with negative points
  When I add a grade with "-1" points
  Then I should be redirected to the assignment page with a "ERROR: negative points" message
  
Scenario: Adding grade with too many points
  When I add a grade with "11" points
  Then I should be redirected to the assignment page with a "ERROR: invalid point amount" message