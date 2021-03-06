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
    And I should see "1 item"
    And I should see "$1.00"
    When I fill in the following:
      | Credit Card Number | 0000 0000 0000 0000 |
      | First Name         | Thomas              |
      | Last Name          | Sinclair            |
      | Month              | 05                  |
      | Year               | 2012                |
      | Verification Code  | 123                 |
    And I choose "bogus"
    And I press "Confirm"
    Then I should see "Successfully Paid Order"
