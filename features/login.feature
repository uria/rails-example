Feature: Ability to log in
  As a registered user
  I want to log-in
  So that I can use my account

  Scenario: Log in with incorrect password
    Given there exists a user:
      |username |password |
      |lonely80 |secret   |
    When I go to login
    And I fill in "Username" with "lonely80"
    And I fill in "Password" with "incorrect"
    And I press "Log-in"
    Then I should see an error notice saying "Incorrect password. Try again."
  Scenario: Log in with correct password
    Given there exists a user:
      |username |password |
      |lonely80 |secret   |
    When I go to login
    And I fill in "Username" with "lonely80"
    And I fill in "Password" with "secret"
    And I press "Log-in"
    Then I should see a notice saying "Login successful."
    And I should see a user menu for "lonely80"

  
