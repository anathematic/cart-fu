Given /^I have an existing item in my cart$/ do
  Given 'I have the existing product "Mercotac 550"'
  When 'I press "Add to Cart"'
  Then 'I should see "Successfully Added to Cart"'
  When 'I follow "Cart"'
  Then 'I should see "1 product"'
end
