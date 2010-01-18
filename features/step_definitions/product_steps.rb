Given /^I have a product with the name "([^\"]*)"$/ do |name|
  Product.make(:name => name, :price => 1.00)
end

Given /^I have the existing product "([^\"]*)"$/ do |arg1|
  Given 'I am on the homepage'
  And 'I have a product with the name "Mercotac 550"'
  When 'I follow "Products"'
  And 'I follow "Mercotac 550"'
  Then 'I should see "Mercotac 550"'
end

Given /^I have 5 existing products$/ do
  Product.make(:price => 4.00, :name => "Second on the list")
  Product.make(:price => 50.00, :name => "Third on the list")
  
  3.times do
    Product.make
  end
end

When /^I follow the second product$/ do
  click_link_within(".product:nth-of-type(3)", "")
end

When /^I follow the third product$/ do
  click_link_within(".product:nth-of-type(4)", "")
end