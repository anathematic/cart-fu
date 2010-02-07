class CartFu < Forgery

  # This list was thanks to
  # http://www.momswhothink.com/reading/list-of-nouns.html
  # Awesome!
  def self.product_name
    dictionaries[:product_names].random
  end
  
end