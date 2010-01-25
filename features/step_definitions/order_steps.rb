Given /^I have an existing order which is pending payment$/ do
  Given 'I am logged in'
  And 'I have an existing item in my cart'
  When 'I press "Checkout"'
  And 'I fill in "Full Name" with "Thomas Sinclair"'
  And 'I fill in "Address Line 1" with "624 George Street"'
  And 'I fill in "Suburb" with "Sydney"'
  And 'I fill in "Postcode" with "2000"'
  And 'I fill in "State" with "New South Wales"'
  And 'I select "Australia" from "Country"'
  And 'I fill in "Phone Number" with "00 0000 0000"'
  And 'I check "My shipping and billing details are the same"'
  And 'I press "Submit Details"'
  Then 'I should see "Confirmation Page"'
  And 'I should see "1 item"'
  And 'I should see "$1.00"'
end

When /^I follow the first order$/ do
  click_link_within(".order", "")
end

Given /^I have an existing paid order$/ do
  @order = Order.make
  @order.paid!
  @order.sent!
end