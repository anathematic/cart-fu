class CartItem

  attr_reader :product, :quantity, :item_id, :size, :price, :sub_total, :perma_link
  
  def initialize(product)
    @product = product
    @quantity = 1
  end
  
  def increment_quantity
    @quantity += 1
  end
  
  def item_id
    @product.id
  end
  
  def size
    @product.size
  end
  
  def price
    @product.price
  end
  
  def sub_total
    @product.price * @quantity
  end
  
  def perma_link
    @product.perma_link
  end
  
end