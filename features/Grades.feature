Feature: Allow a teacher to add grades for an assignment. Teacher should also see stats for the grades that have been entered

Background: courses have been added to the application

  Given the following users have been added to the database:
  | email                          | user_id | role    | year     | password    |
  | user1@user.com                 | user1   | Student | Freshman | passwordtest|
  | user2@user.com                 | user2   | Teacher | Freshman | passwordtest|
  | user3@user.com                 | user3   | Student | Freshman | passwordtest|
  Given the following courses have been added to the database:
  | name                          | year_restrictions | course_number |
  | Intro to Software Engineering | none              | SE:101        |
  
  Given the following assignments have been added to the database:
  | title                         | points            | 
  | Homework 1                    | 10                |

  And  User "user1" has been added to "SE:101"
  And  User "user2" has been added to "SE:101"
  And  User "user3" has been added to "SE:101"
  And  Assignment "Homework 1" has been added to "SE:101"
  And  "user2" is logged in with password "passwordtest"
  And  "user2" is on the "Homework 1" grades page for "SE:101" 
  
Scenario: Adding a grade for an assignment
  When I add a grade with "5" points for "user1"
  Then I should be redirected to the assignment page with a "success" message
  
Scenario: Adding multiple grades for an assignment
  When I add multiple grades with "5" points for "user1" and "5" points for "user3"
  Then I should be redirected to the assignment page with a "success" message
  
Scenario: Seeing the average grade for all assignments
  When I add multiple grades with "0" points for "user1" and "0" points for "user3"
  Then I should be able to see the average score of "0" on the "Homework 1" page