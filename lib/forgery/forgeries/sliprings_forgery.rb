class SlipringsForgery < Forgery

  def self.product_name
    dictionaries[:product_names].random
  end
  
  def self.product_serial_no
    dictionaries[:product_serial_no].random
  end

end