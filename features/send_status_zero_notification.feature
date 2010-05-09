Feature: sending a status zero notification
  As a firefighter
  I should be able to send a message to my station mates letting them know the station is empty
  In order to sure it will be covered now that I'm leaving
  
  Scenario: "Sending a status zero notification"
    Given there is a department called "BCFPD"
      And there is a station named "Station 14" in that department
      And there is a firefighter named "Chris Swisher" who is subscribed to messages for "Station 14"
      And I am logged in as a firefighter named "Andrew Elli" who is a publisher for "Station 14"
    When I select "5:45 PM" as the time
      And I press "Send!"
    Then I should see "Your notification has been sent!"
      And the firefighter named "Chris Swisher" should have received a notification saying "Station 14 will be STATUS 0 until 5:40 PM" 