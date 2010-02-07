# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

@user = User.find_or_create_by_name(:name => "admin", :email => "admin@testdomain.com", :password => "12345", :password_confirmation => "12345")
@user.admin!