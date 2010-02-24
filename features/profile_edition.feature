Feature: Profile edition
  As a registered user
  I want to edit my profile
  So that I am  more popular
  Scenario: Only if logged in
    Given I am not logged in
    When I go to edit profile
    Then I should be on the homepage
    And I should see an error notice saying "Access denied."
  Scenario: Show necessary fields
    Given I am logged in as:
    | username |
    | lonely80 |
    And I go to edit profile
    Then I should be on edit profile
    And I should see a "Status" field
    And I should see a "Height" field
    And I should see a "Body type" field
    And I should see an "Smoker" field
    And I should see an "About me" field
    And I should see a "What I am looking for" field
    And I should see a "Update Profile" button
  Scenario: Data is correctly saved
    Given I am logged in as:
    | username |
    | lonely80 |
    When I go to edit profile
    And I fill in the following:
      | About me | I'm a nice guy |
    And I press "Update Profile"
    And I go to "lonely80" page
    Then I should see "I'm a nice guy"
  Scenario: After editing the profile during the registration I should be redirected to photo upload
    Given I am not logged in
    When I register as:
                  | username | password | password_confirmation | email              | birthdate        | county   | city  | gender | looking_for |
                  | lonely80 | secret   | secret                | lonely80@email.com | December 3, 1980 | Asturias | Gijon | man    | woman       |
    And I press "Update Profile"
    Then I should be on photo upload
    
    
    
