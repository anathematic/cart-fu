require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "Thomas Sinclair",
      :email => "thomas@icdesign.com.au",
      :password => "12345",
      :password_confirmation => "12345"
    }
    
    @user = User.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @user.should be_valid
    @user.save!
    @user.permission.should eql("user")
    @user.admin?.should eql(false)
  end
end
