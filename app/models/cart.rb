class Cart
  
  attr_reader :products
  
  def initialize
    @products = []
    # @user_details = Hash.new
  end
  
  def add_product(product_id)
    current_product = @products.find { |product| product.product_id == product_id }
    
    if current_product
      current_product.increment_quantity
    else
      current_product = CartItem.new(product_id)
      @products << current_product
    end
    current_product
  end

  def remove_product(product_id)
    current_product = @products.find {|item| item.product_id == product_id}
    @products.delete(current_product)
  end

  def update_products(products)    
    products.each do |product|
      current_product = @products.find { |current_product| product["product_id"] == current_product.product_id }
      current_product.set_quantity(product["quantity"]) if current_product
    end
  end
  
  def empty_cart
    @products = []
  end
  
  def total_items
    @products.sum { |item| item.quantity }
  end  
  
  def total_price
    @products.sum { |item| item.sub_total }
  end
  
end