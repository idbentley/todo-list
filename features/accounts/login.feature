Feature: Account creation and login

	Scenario: Unauthenticated user login into an account
	Given I am on the login page
	And there is an existing account with email = "ian.bentley@gmail.com" and password = "secure!"
  When I fill in "email" with "ian.bentley@gmail.com"
  And I fill in "password" with "secure!"
	And I press "Login"
	Then I should see "Login successful"
