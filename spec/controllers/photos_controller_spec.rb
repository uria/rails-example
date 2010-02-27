require 'spec_helper'

describe PhotosController do
  before(:each) do
    user = mock_model(User)
    photos = mock(Array)
    photos.stub!(:size).and_return 10
    user.stub!(:photos).and_return photos
    controller.stub!(:current_user).and_return user
  end
    
  #Delete these examples and add some real ones
  it "should use PhotosController" do
    controller.should be_an_instance_of(PhotosController)
  end

  describe "Photo creation when the user already has 10 photos" do
    describe "GET 'new'" do
      it "should be successful" do
        get 'new'
        response.should redirect_to(root_path)        
      end      
    end
  
    describe "POST 'create'" do
      it "should not create a new photo if there are 10 already" do
        image = fixture_path + "/image.jpg"
        file = ActionController::TestUploadedFile.new(image, "image/jpg")    
        Photo.should_not_receive(:new)
        post 'create', :photo => {:photo => file}
        response.should redirect_to(root_path)        
      end
    end
  end
end
