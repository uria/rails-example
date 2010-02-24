require 'spec_helper'

describe User do
  before(:each) do
        
    @valid_attributes = {
      :username => "lonely80",
      :email => "lone@lone.com",
      :password => "secret",
      :password_confirmation => "secret",
      :birthdate => 20.years.ago,
      :county => County.create(:name => "Sussex"),
      :gender => Gender.create(:name => "Man"),
      :looking_for => Gender.create(:name => "Woman")
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
  
  it "should have a profile right after being created" do
    u = User.create!(@valid_attributes)
    u.profile.should_not be_nil
    u.profile.should_not be_new_record
  end
  
end
