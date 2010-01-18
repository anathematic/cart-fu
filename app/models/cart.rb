class Cart
  
  attr_reader :products
  
  def initialize
    @products = []
    # @user_details = Hash.new
  end
  
  def add_product(product)
    current_product = @products.find {|product| product.id == product.id }
    
    if current_product
      current_product.increment_quantity
    else
      current_product = CartItem.new(product)
      @products << current_product
    end
    current_product
  end

  def remove_product(product)
    current_item = @items.find {|item| item.product == product}
    @items.delete(current_item)
  end
  
  def empty_cart
    @items = []
  end
  
  def total_items
    @items.sum { |item| item.quantity }
  end  
  
  def total_price
    @items.sum { |item| item.sub_total }
  end
  
end