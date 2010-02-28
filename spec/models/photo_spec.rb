require 'spec_helper'
include ActionController::TestProcess

describe Photo do
  before(:each) do
    @user_with_10_photos = mock_model(User)
    @user_with_10_photos.stub(:photos).and_return((1..10).collect { |i| mock_model(Photo)})
  end
  
  describe "Photo creation for a user with 10 photos already" do
    it "should have an error on photo after creation" do
      p = Photo.new
      p.photo = fixture_file_upload("image.jpg", "image/jpg")
      p.user = @user_with_10_photos
      p.save
      p.should have(1).errors_on(:photo)
    end
  end
  

end
