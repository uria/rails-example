Feature: User registration
    As a lonely heart
    I want to register in the website
    So that I can conctact other people    
    Scenario: Homepage should have a link to "Register"
        Given I am not logged in
        When I go to the homepage
        Then I should see a link to "Register"
	Scenario: Registration page
		Given I am not logged in
		When I go to the homepage
		And I follow "Register"
		Then I should be on /users/new
		Then I should see a "Username" field
		And I should see an "Email address" field
		And I should see a "Password" field
		And I should see a "Password confirmation" field
		And I should see a "Register" button
	Scenario: Impossible to register with a taken login
		Given there exists a user:
                  | username |
                  | john     |
                When I register as:
                  | username | password | password_confirmation | email              |
                  | john     | secret   | secret                | lonely80@email.com |
		Then I should see an error saying "has already been taken"
	Scenario: After registration users are asked to edit their profile
		Given I am not logged in
                When I register as:
                  | username | password | password_confirmation | email              |
                  | lonely80 | secret   | secret                | lonely80@email.com |
		Then I should be on edit profile
		And I should see a notice saying "Registration successful."
	Scenario: After registration user should be logged in
		Given I am not logged in
                When I register as:
                  | username | password | password_confirmation | email              |
                  | lonely80 | secret   | secret                | lonely80@email.com |
		Then I should see a user menu for "lonely80"
	
 
