Feature: removing subscriptions to station messages
  As a firefighter
  I want to unsubscribe from messages at certain stations
  In order to not be bothered my notifications that aren't relevant to me
  
  Scenario: Unsubscribe from only subscription
    Given I am logged in as a firefighter named "Patrick Sapp" who is part of "BCFPD"
      And "Patrick Sapp" has no subscriptions
      And there is a station named "Station 14" in "BCFPD"
      And "Patrick Sapp" is subscribed to messages for "Station 14"
      And I am on the home page
      And I should see "Station 14"
    When I press "Unsubscribe"
    Then I should be on the home page
      And I should not see "Station 14"