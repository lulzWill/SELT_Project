Feature: Allow users to login_path
  
Scenario: Login as a Student
  When I have entered UserId "student" and password "student"
  Then I should be logged in as "Student"
    
Scenario: Login as a Teacher
  When I have entered UserId "teacher" and password "teacher"
  Then I should be logged in as "Teacher"
    
Scenario: Login as a Admin
  When I have entered UserId "admin" and password "admin1" 
  Then I should be logged in as "Admin"
    
Scenario: Invalid Login
  When I have entered UserId "doesnot" and password ""
  Then I should be redirected to login path
    