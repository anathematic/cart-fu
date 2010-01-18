require 'machinist/active_record'
require 'sham'
require 'forgery'

Sham.define do
  name { "Foo" }
  description { "Bar" }
  price { rand(100) }
end

Dir[File.join(File.dirname(__FILE__), "blueprints", "*.rb")].each { |f| require f }