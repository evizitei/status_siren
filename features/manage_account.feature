Feature: managing your account
  As a firefighter
  I want to choose what department I'm a part of
  In order to subscribe to the right stations
  
  Scenario: Changing the users department
    Given there is a department called "BCFPD"
      And I am logged in as a firefighter named "Kevin Wine"
    When I follow "My Account"
      And I select "BCFPD" from "Department:"
      And I press "Save"
    Then I should be on the homepage
      And I should see "BCFPD"