Feature: Products
  In order to make money via selling products
  As a user
  I want to be able to view and navigate through products
  
  Scenario: I can view a product
    Given I am on the homepage
    And I have a product with the name "Mercotac 550"
    When I follow "Products"
    And I follow "Mercotac 550"
    Then I should see "Mercotac 550"
    