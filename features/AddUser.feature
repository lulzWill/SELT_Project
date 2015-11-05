Feature: Allow a user to sign up for the website
  
Scenario: Sign up studnet
  When I have successfully signed up as a "student"
  Then I should be shown "student" confirmation on the homepage
  
Scenario: Sign up Professor
  When I have successfully signed up as a "professor"
  Then I should be shown "professor" confirmation on the homepage

Scenario: Sign up Admin
  When I have successfully signed up as a "admin"
  Then I should be shown "admin" confirmation on the homepage