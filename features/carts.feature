Feature: Carts
  In order to generator revenue for the website
  As a user
  I want to be able to add things to my cart

  Background:
    Given I have the existing product "Mercotac 550"

  Scenario: I can add products to my cart
    When I press "Add to Cart"
    Then I should see "Successfully Added to Cart"
    When I follow "Cart"
    Then I should see "1 product"
  
  Scenario: I can do things with the products in my cart
    Given I have an existing item in my cart
    And I have 5 existing products
    When I fill in "Quantity" with "5"
    And I press "Update Cart"
    Then I should see "5"
    And I should see "$5.00"
    And I should see "Checkout"
    When I follow "Products"
    And I follow the first product
    And I press "Add to Cart"
    Then I should see "Successfully Added to Cart"
    When I follow "Cart"
    Then I should see "1"
    And I should see "5"
    And I should see "$10.00"
    When I follow "Products"
    And I follow the second product
    And I press "Add to Cart"
    Then I should see "Successfully Added to Cart"
    When I follow "Cart"
    Then I should see "1"
    And I should see "$60.00"
 