class User < ActiveRecord::Base

  include AASM
  
  has_many :orders
  
  acts_as_authentic do |c|
    c.login_field = :email
    c.logged_in_timeout = 30.days.from_now
  end
  
  attr_protected :permission
  
  aasm_column :permission
  aasm_initial_state :user
  aasm_state :user
  aasm_state :admin
  
  aasm_event :user do
    transitions :to => :user, :from => :admin
  end
  
  aasm_event :admin do
    transitions :to => :admin, :from => :user
  end
  
end
