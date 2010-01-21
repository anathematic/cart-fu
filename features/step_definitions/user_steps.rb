Given /^I have an existing account$/ do
  Given 'I am on the homepage'
  When 'I follow "Register"'
  And 'I fill in "Email" with "thomas@icdesign.com.au"'
  And 'I fill in "Password" with "12345"'
  And 'I fill in "Password Confirmation" with "12345"'
  And 'I press "Create Account"'
  Then 'I should see "Successfully Created Account"'
end

Given /^I am logged in$/ do
  Given 'I have an existing account'
  When 'I follow "Logout"'
  Then 'I should see "Successfully Logged Out"'
  When 'I follow "Login"'
  And 'I fill in "Email" with "thomas@icdesign.com.au"'
  And 'I fill in "Password" with "12345"'
  And 'I press "Login"'
  Then 'I should see "Successfully Logged In"'
end