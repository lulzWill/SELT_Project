Feature: Assignments functionality

Background: I am on the assignments_home page as a professor
  
  Given the following users have been added to the table
  |user_id|password_digest|role   |
  |student|student        |Student|
  |teacher|teacher        |Teacher|
  |admin  |admin1         |Admin  |
  And the following courses have been added to the table
  |name   |
  |Course1|
  And the following assignments have been added to the table for the course name "Course1"
  |name            |points|dueDate                  |
  |Assignment2     |2     |"2015-12-23 00:00:00 UTC"|
  |deleteAssignment|10    |"2015-12-23 00:00:00 UTC"|
  And the users are enrolled in "Course1"
  And I have entered UserId "teacher" and password "teacher"
  And I am on the assignments page with course by the name of "Course1"
  
Scenario: Add an assignment with the valid params
  When I have entered the name "Assignment1" with "0" points and clicked create assignment
  Then I should see an assignment in the table that has the name "Assignment1" and it should have "0" points
  
Scenario: Add an assignment with invalid params
  When I have entered the name " " with "0" points and clicked create assignment
  Then I should NOT see an assignment with the name " " in the table
  
Scenario: Delete assignment
  When I have clicked to delete the assignment by the name of "deleteAssignment" 
  Then I should NOT see an assignment with the name "deleteAssignment" in the table

Scenario: Edit assignment with invailid params
  When I have updated the assignment with the name "Assignment2" to " " and change the points to "10"
  Then I should NOT see an assignment with the name " " in the table
  Then I should see an assignment in the table that has the name "Assignment2" and it should have "2" points

Scenario: Click view grades
  When I click view grades on an assignment
  Then I should be redirected to the grades page
