Given /^I have a product with the name "([^\"]*)"$/ do |name|
  Product.make(:name => name)
end