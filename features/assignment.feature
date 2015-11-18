Feature: Assignments functionality
  
Background: I am on the assignments_home page with limited functionality
  Given the following users have been added to the table
  |user_id|password_digest|role   |
  |student|student        |Student|
  |teacher|teacher        |Teacher|
  And the following courses have been added to the table
  |user_id|name|
  |teacher|Course1|

Scenario: On the assignments page but not logged in
  When I am on the assignments page
  Then I should see a flash message saying " "

Scenario: On the assignments page with no course selected
  When I am logged in as UserId "teacher" and password "teacher"
  And I am on the assignments page
  Then I should see a flash message saying " "
  
Scenario: On the assignments page as a Professor with no assignments
  When I have selected the course with the name "Course1"
  Then I should see the message "" in the first table row
  
Background: I am on the assignments_home page as a professor
  
  Given the following users have been added to the table
  |user_id|password_digest|role   |
  |student|student        |Student|
  |teacher|teacher        |Teacher|
  |admin  |admin1         |Admin  |
  And the following courses have been added to the table
  |user_id|name|
  |teacher|Course1|
  And the following assignments have been added to the table for the course name "Course1"
  |name            |points|
  |Assignment2     |2     |
  |deleteAssignment|10    |
  And I am logged in as UserId "teacher" and password "teacher"
  And I have selected the course with the name "Course1"
  And I am on the assignments page
  
Scenario: Add an assignment with the valid params
  When I have entered the name "Assignment1" with "0" points and clicked create assignment
  Then I should see an assignment in the table that has the name "Assignment1" and it should have "0" points
  
Scenario: Add an assignment with invalid params
  When I have entered the name " " with "0" points and clicked create assignment
  Then I should NOT see an assignment with the name " " in the table
  
Scenario: Delete assignment
  When I have clicked to delete the assignment by the name of "deleteAssignment" 
  Then I should NOT see an assignment with the name "deleteAssignment" in the table
  
Scenario: Edit assignment with vailid params
  When I have updated the assignment with the name "Assignment1" to "Assign1" and change the points to "10"
  Then I should see an assignment in the table that has the name "Assign1" and it should have "10" points
  Then I should NOT see the assignment with the name "Assignment1" in the table

Scenario: Edit assignment with invailid params
  When I have updated the assignment with the name "Assignment2" to " " and change the points to "10"
  Then I should NOT see an assignment with the name " " in the table
  Then I should see an assignment in the table that has the name "Assignment2" and it should have "2" points

Scenario: Click view grades
  When I select view grades on an assignment
  Then I should be redirected to the grades page
  
Background: I am on the assignments_home page as a student
  Given the following users have been added to the table
  |user_id|password_digest|role   |
  |student|student        |Student|
  And the following courses have been added to the table
  |user_id|name|
  |teacher|Course1|
  And the following assignments have been added to the table for the course name "Course1"
  |name            |points|
  |Assignment2     |2     |
  |deleteAssignment|10    |
  And I am logged in as UserId "teacher" and password "teacher"
  And I have selected the course with the name "Course1"
  And I am on the assignments page