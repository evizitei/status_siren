Feature: Adding a subscription
  As a firefighter
  I want to subscribe to my station and others nearby
  In order to receive notifications that are relevant to me
  
  Scenario: Adding my first subscription
    Given I am logged in as a firefighter named "Bob Sobule" who is part of "BCFPD"
      And "Bob Sobule" has no subscriptions
      And there is a station named "Station 14" in "BCFPD"
      And I am on the home page
      And I should not see "Station 14"
    When I press "Add Station"
      And I select "Station 14" from "Station:"
      And I press "Subscribe!"
    Then I should be on the home page
      And I should see "Station 14"
  
  Scenario: Adding a second subscription
    Given I am logged in as a firefighter named "Oliver Vizitei" who is part of "BCFPD"
      And there is a station named "Station 14" in "BCFPD"
      And "Oliver Vizitei" is subscribed to messages for "Station 14"
      And there is a station named "Station 8" in "BCFPD"
      And I am on the home page
      And I should see "Station 14"
      And I should not see "Station 8"
    When I press "Add Station"
      And I select "Station 8" from "Station:"
      And I press "Subscribe!"
    Then I should be on the home page
      And I should see "Station 14"
      And I should see "Station 8"
      
  Scenario: Adding a station I'm already subscribed to
    Given I am logged in as a firefighter named "Stephen Dunkin" who is part of "BCFPD"
      And there is a station named "Station 14" in "BCFPD"
      And "Stephen Dunkin" is subscribed to messages for "Station 14"
      And I am on the home page
      And I should see "Station 14"
    When I press "Add Station"
      And I select "Station 14" from "Station:"
      And I press "Subscribe!"
    Then I should be on the home page
      And I should see "Station 14"
      And I should see "You are already subscribed to messages for Station 14"