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
    Given context
    When event
    Then outcome
 