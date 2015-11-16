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
    
Scenario: Login as an Admin
  When I have entered UserId "admin" and password "admin1" 
  Then I should be logged in as "admin"
    
Scenario: Invalid Login and Password
  When I have entered UserId "doesnot" and password ""
  Then I should be redirected to login path
  
Scenario: Valid Id/Invalid Password
  When I have entered UserId "admin" and password "not a password"
  Then I should be redirected to login path
  
Scenario: Valid Password/Invalid Id
  When I have entered UserId "notanadminid" and password "admin1"
  Then I should be redirected to login path
  
Scenario: Valid Password and ID but for different users
  When I have entered UserId "admin" and password "student"
  Then I should be redirected to login path