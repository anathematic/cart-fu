class Cart
  
  def initialize
    @items = []
    @user_details = Hash.new
  end
  
  def add_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      current_item = CartItem.new(product)
      @items << current_item
    end
    current_item
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