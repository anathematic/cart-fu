Product.blueprint do
  name
  description { Forgery(:lorem_ipsum).paragraphs(2) }
  price
end