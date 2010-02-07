class CartFu < Forgery

  def self.product_name
    dictionaries[:product_names].random
  end
  
end