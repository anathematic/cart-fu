require 'spec_helper'

describe Photo do
  before(:each) do
    @valid_attributes = {
      :name => "A red ball",
      :photo => File.open("#{RAILS_ROOT}/spec/fixtures/red-ball.jpg")
    }
  end

  it "should create a new instance given valid attributes" do
    Photo.create!(@valid_attributes)
  end
end
