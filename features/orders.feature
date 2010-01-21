Feature: Orders
  In order to keep records of purchases on the website
  As a user
  I want to be able to view orders and receive updates on them
  
  Scenario: I can navigate through orders and the details of an existing order
    Given I have an existing order which is pending payment
    When I follow "My Orders"
    And I follow the first order
    Then I should see "This order has not yet been paid for, pay now"
    When I follow "Edit"
    And I fill in "Suburb" with "Melbourne"
    And I press "Update Details"
    Then I should see "Successfully Updated Order"
    And I should see "Melbourne"
  
  
  

  
