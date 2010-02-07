require 'machinist/active_record'
require 'sham'
require 'forgery'

Sham.define do
  product_name { CartFu.product_name }
  price { rand(100) }
  name { Forgery(:name).full_name }
  email { Forgery(:internet).email_address }
  
  street_address { Forgery(:address).street_address }
  suburb { Forgery(:address).city }
  postcode { Forgery(:address).zip }
  state { Forgery(:address).state }
  country { Forgery(:address).country }
  phone_number { Forgery(:address).phone }
end

Dir[File.join(File.dirname(__FILE__), "blueprints", "*.rb")].each { |f| require f }