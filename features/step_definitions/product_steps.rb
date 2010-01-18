Given /^I have a product with the name "([^\"]*)"$/ do |name|
  Product.make(:name => name)
end

Given /^I have the existing product "([^\"]*)"$/ do |arg1|
  Given 'I am on the homepage'
  And 'I have a product with the name "Mercotac 550"'
  When 'I follow "Products"'
  And 'I follow "Mercotac 550"'
  Then 'I should see "Mercotac 550"'
end

Given /^I have 5 existing products$/ do
  5.times do
    Product.make
  end
end