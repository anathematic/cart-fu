Feature: Admin
  In order to maintain parts of the website
  As an admin
  I want to be able to manage products, orders and users
  
  Background:
    Given I am logged in as an admin
    
  Scenario: I can create users and view a users details
    When I follow "Users"
    And I follow "New User"
    And I fill in "Name" with "Thomas Sinclair"
    And I fill in "Email" with "thomas@github.com"
    And I fill in "Password" with "12345"
    And I fill in "Password Confirmation" with "12345"
    And I press "Create User"
    Then I should see "Successfully Created User"
    And I should see "Thomas Sinclair"
    When I follow "Edit"
    And I fill in "Name" with "Thomas Trent"
    And I press "Update User"
    Then I should see "Successfully Updated User"
    And I should see "Thomas Trent"
    When I follow "Destroy"
    Then I should see "Successfully Destroyed User"
  
  # Scenario: I can export a list of users as well as export existing users

  Scenario: I can create products and view them
    When I follow "Products"
    And I follow "New Product"
    And I fill in "Name" with "Red Ballon"
    And I fill in "Price" with "5.00"
    And I fill in "Description" with "This is the all mighty red ballon, only sale this week only."
    And I attach the file "spec/fixtures/red-ball.jpg" to "Photo"
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
    And I should see "There are currently no products, create one"
   
  Scenario: I can view existing orders and update their status
    Given I have an existing paid order
    When I follow "Orders"
    And I follow the first order
    Then I should see "This order is currently pending delivery"
    When I press "mark as delivered"
    Then I should see "Successfully Updated Order"
    And I should see "This order has been delivered"
    