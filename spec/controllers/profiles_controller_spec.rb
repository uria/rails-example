require 'spec_helper'

describe ProfilesController do

  #Delete these examples and add some real ones
  it "should use ProfilesController" do
    controller.should be_an_instance_of(ProfilesController)
  end


  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should be successful" do
      get 'update'
      response.should be_success
    end
  end
end
