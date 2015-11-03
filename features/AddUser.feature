Feature: Allow a user to sign up for the website
  
Scenario: Sign up studnet
  When I have signed up as a "student"
  Then I should be directed to the "student" landing homepage
  
Scenario: Sign up Professor
  When I have signed up as a "professor"
  Then I should be directed to the "professor" landing homepage

Scenario: Sign up Admin
  When I have signed up as a "admin"
  Then I should be directed to the "admin" landing homepage
  