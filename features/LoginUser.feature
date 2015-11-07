Feature: Allow users to login_path
  
  Scenario: Login as a Student
    When I have entered a User-Id "student" and password "student"
    Then I should be logged in as a "Student" with User-Id "student"
    
  Scenario: Login as an Teacher
    When I have entered the User-Id "teacher" and password "teacher"
    Then I should be logged in as the "Teacher" with User-Id "teacher"
    
  Scenario: Login as an Admin
    When I have entered User-Id "admin" and password "admin1" 
    Then I should be logged in as "Admin" with User-Id "admin"
    
  Scenario: Invalid Login
    When I have entered this User-Id "doesnot" and password ""
    Then I should be redirected to login path
    