Feature: Allow a user to sign up for the website
  
Scenario: Sign up studnet
  When I have successfully signed up as a "Student"
  Then I should be shown "Student" confirmation on the homepage
  
Scenario: Sign up Professor
  When I have successfully signed up as a "Teacher"
  Then I should be shown "Teacher" confirmation on the homepage

Scenario: Sign up Admin
  When I have successfully signed up as a "Admin"
  Then I should be shown "Admin" confirmation on the homepage

@culerity
Scenario: Mismatching Passwords
  When I have filled out the sign up form with mismatching passwords
  Then I should be shown an error message

@culerity
Scenario: Wrong validation code
  When I have filled out the sign up form with an incorrect validation code
  Then I should be shown an error message

@culerity
Scenario: Wrong Email Format
  When I have filled out the sign up form with a bad email
  Then I should be shown an error message

@culerity 
Scenario: Password too short
  When I have filled out the sign up form with a short password
  Then I should be shown an error message

@culerity
Scenario: Password too long
  When I have filled out the sign up form with a long password
  Then I should be shown an error message