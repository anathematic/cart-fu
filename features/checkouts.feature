Feature: Checkout
  In order to buy things from the website
  As a user
  I want use the items in my cart to create an order / checkout
  
  Scenario: I can checkout the items in my cart
    Given I am logged in
    And I have an existing item in my cart
    When I press "Checkout"
    And I fill in "Full Name" with "Thomas Sinclair"
    And I fill in "Address Line 1" with "624 George Street"
    And I fill in "Suburb" with "Sydney"
    And I fill in "Postcode" with "2000"
    And I fill in "State" with "New South Wales"
    And I select "Australia" from "Country"
    And I fill in "Phone Number" with "00 0000 0000"
    And I check "My shipping and billing details are the same"
    And I press "Submit Details"
    Then I should see "Confirmation Page"
    When I fill in "Credit Card Number" with "0000 0000 0000 0000"
    And I fill in "Month" with "05"
    And I fill in "Year" with "2088"
    And I fill in "CCV" with "123"
    And I press "Confirm"
    Then I should see "Thanks for the order"
    And I should receive an email