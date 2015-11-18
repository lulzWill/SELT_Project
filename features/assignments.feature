Feature: Assignments functionality
  
Background: I am on the assignments home page as a professor
  
  Given the following users has been added and is signed in
  |user_id|password_digest|role   |
  |teacher|teacher        |Teacher|
  And the following course has been added and is the current class
  |user_id|name|
  |teacher|Course1|
  And the following assignments are in the database
  |user_id|course_id|name|points|
  And I am on the assignments page
  
Scenario: Add an assignment with the valid params
  When I have entered name "Assignment1" and points "0"
  Then I should see the name "Assignment1" with points "0" added to the table
  