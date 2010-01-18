class CartItem
  
  attr_reader :product_id, :quantity
  delegate :name, :price, :dom_id, :to_params, :to => :product
  
  def initialize(product_id)
    @product_id = product_id
    @quantity = 1
    @product = Product.find(product_id)
  end
  
  def product
    @product
  end
  
  def product_id
    @product_id
  end
  
  def increment_quantity
    @quantity += 1
  end
  
  def set_quantity(quantity)
    @quantity = (quantity.to_i)
  end
  
  def sub_total
    @product.price * @quantity
  end
  
end