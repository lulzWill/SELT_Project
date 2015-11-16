Feature: Allow users to login_path

Background: users in the user table
  
  Given the following users have been added to the table
  |user_id|password_digest|role   |
  |student|student        |Student|
  |teacher|teacher        |Teacher|
  |admin  |admin1         |Admin  |

Scenario: Login as a Student
  When I have entered UserId "student" and password "student"
  Then I should be logged in as "student"
    
Scenario: Login as a Teacher
  When I have entered UserId "teacher" and password "teacher"
  Then I should be logged in as "teacher"
    
Scenario: Login as a Admin
  When I have entered UserId "admin" and password "admin1" 
  Then I should be logged in as "admin"
    
Scenario: Invalid Login
  When I have entered UserId "doesnot" and password ""
  Then I should be redirected to login path
    