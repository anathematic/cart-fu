class User < ActiveRecord::Base
  
  acts_as_authentic do |c|
    c.login_field = :email
    c.logged_in_timeout = 30.days.from_now
  end
  
end
