Feature: Admin
  In order to maintain parts of the website
  As an admin
  I want to be able to manage products, orders and users
  
  Background:
    Given I am logged in as an admin
    
  Scenario: I can create users and view a users details
    When I follow "Products"
    And I follow "New Product"
    And I fill in "Name" with "Red Ballon"
    And I fill in "Price" with "5.00"
    And I fill in "Description" with "This is the all mighty red ballon, only sale this week only."
    And I press "Create Product"
    Then I should see "Successfully Created Product"
    And I should see "Red Ballon"
    When I follow "Edit"
    And I fill in "Price" with "10.00"
    And I press "Update Product"
    Then I should see "Successfully Updated Product"
    And I should see "$10.00"
    When I follow "Destroy"
    Then I should see "Successfully Destroyed Product"
    And I should see "There are no products, create one."
  
  Scenario: I can export a list of users as well as export existing users
    Given context
    When event
    Then outcome
  
  Scenario: I can create products and view them
    Given context
    When event
    Then outcome
  
  Scenario: I can view existing orders and update their status
    Given context
    When event
    Then outcome
  
  
  
  
  
  
  
  
  

  
