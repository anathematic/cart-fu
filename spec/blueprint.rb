require 'machinist/active_record'
require 'sham'
require 'forgery'

Sham.define do
  name { SlipringsForgery.product_name }
  price { rand(100) }
end

Dir[File.join(File.dirname(__FILE__), "blueprints", "*.rb")].each { |f| require f }