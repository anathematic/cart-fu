Feature: Carts
  In order to generator revenue for the website
  As a user
  I want to be able to add things to my cart

  Scenario: I can add products to my cart
    Given I have the existing product "Mercotac 550"
    When I press "Add to Cart"
    Then I should see "Successfully Added to Cart"
    When I follow "Cart"
    Then I should see "1 product"
    And I should see "$1.00"
  
  Scenario: I can do things with the products in my cart
    Given I have an existing item in my cart
    And I have 5 existing products
    When I fill in "Quantity" with "6"
    And I press "Update Cart"
    Then I should see "6"
    And I should see "$6.00"
    When I follow "Products"
    And I follow the second product
    And I press "Add to Cart"
    Then I should see "Successfully Added to Cart"
    When I follow "Cart"
    Then I should see "2 products"
    And I should see "$10.00"
    When I follow "Products"
    And I follow the third product
    And I press "Add to Cart"
    Then I should see "Successfully Added to Cart"
    When I follow "Cart"
    Then I should see "1"
    And I should see "$60.00"
 
 Scenario: I can remove products from my cart
   Given I have an existing item in my cart
   When I press "Remove"
   Then I should see "Successfully Removed from Cart"
   And I should see "There are no products in your cart"

 
 
 