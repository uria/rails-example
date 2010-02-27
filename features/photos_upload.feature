Feature: Photo management
  As a user
  In order to show other users how attractive I am
  I want todo upload photos
  Scenario: Can only access if logged in
    Given I am not logged in
    When I go to photos
    Then I should be on the homepage
    And I should see an error notice saying "Access denied."
  Scenario: Can upload a photo
    Given I am logged in as:
    | username |
    | lonely80 |
    When I go to photos
    And I follow "Add new photo"
    And I attach the file "features/file-uploads/image.jpg" to "photo"
    And I press "Upload"
    Then I should be on photos
    And I should see a notice saying "Photo uploaded."
    And I should see 1 thumbnail photo
  Scenario: I can list my uploaded photos
    Given I am logged in as:
    | username |
    | lonely80 |
    And I have uploaded 3 photos
    When I go to photos
    Then I should see 3 thumbnail photos
  Scenario: Can't upload photos that are too big
    Given I am logged in as:
    | username |
    | lonely80 |
    When I upload photo "features/file-uploads/toobig.jpg"
    Then I should see "file size must be"
  Scenario: When I have 10 photos I can't upload any more
    Given I am logged in as:
    | username |
    | lonely80 |
    And I have uploaded 10 photos
    When I go to photos
    Then I should not see "Add new photo"
  Scenario: I can delete a photo
    Given I am logged in as:
    | username |
    | lonely80 |
    And I have uploaded 2 photos
    When I go to photos
    And I follow "delete"
    Then I should be on photos
    And I should see 1 thumbnail photo
