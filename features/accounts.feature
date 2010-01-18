Feature: Accounts
  In order to allow users to checkout and check on their order status
  As a user
  I want to be able to signnup for an account
  
  Scenario: I can signup for an account
    Given I am on the homepage
    When I follow "Register"
    And I fill in "Email" with "thomas@icdesign.com.au"
    And I fill in "Password" with "12345"
    And I fill in "Password Confirmation" with "12345"
    And I press "Create Account"
    Then I should see "Successfully Created Account"
    And "thomas@icdesign.com.au" should receive 1 email
    