Feature: Allow a teacher to add grades for an assignment

Background: courses have been added to the application

  Given the following users have been added to the database:
  | email                          | user_id | role    | year     | password    |
  | user1@user.com                 | user1   | Student | Freshman | passwordtest|
  | user2@user.com                 | user2   | Student | Freshman | passwordtest|
  
  Given the following courses have been added to the database:
  | name                          | year_restrictions | course_number |
  | Intro to Software Engineering | none              | SE:101        |
  
  Given the following assignments have been added to the database:
  | name                          | points            | 
  | Homework 1                    | 10                |

  And  User "user1" has been added to "SE:101"
  And  Assignment "Homework 1" has been added to "SE:101"
  And  "user1" is logged in with password "passwordtest"
  And  "user1" is on the "Homework 1" grades page for "SE:101" 
  
Scenario: Adding a grade for an assignment
  When I add a grade with "5" points
  Then I should be redirected to the assignment page with a "success" message