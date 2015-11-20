Feature: Navbar functionality
  
Background: users in the user table
  
  Given the following users have been added to the table
  |user_id|password_digest|role   |
  |student|student        |Student|
  |teacher|teacher        |Teacher|
  |admin  |admin1         |Admin  |
  
  Scenario: Click on homepage link, send to login
    When I have not logged in
    Then redirect to new_user_path
    
  Scenario: Click on homepage link, send to courses
    When I am logged in 
    Then redirect to home_path
    
  Scenario: Click on logout button when logged in
    When I click on logout button when logged in
    Then redirect to new_user_path and display logout message
    
  Scenario: Click on user id link and go to user profile
    When I am logged in "student" and click on link in navbar
    Then I should be redirected to "1" profile