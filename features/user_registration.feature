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
		Then I should see a "Login" field
		And I should see an "e-mail" field
		And I should see a "Password" field
		And I should see a "Password confirmation" field
