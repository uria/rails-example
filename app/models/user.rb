class User < ActiveRecord::Base
  belongs_to :county
  belongs_to :gender
  belongs_to :looking_for, :class_name => "Gender"
  has_one :profile
  
  has_many :photos
  
  acts_as_authentic
  
  validates_presence_of :birthdate
  validates_associated :county
  validates_associated :gender, :looking_for

  before_create :create_profile

  def create_profile
    self.profile = Profile.new
  end
  
  def delete_photo(id)
    self.photos.find(id).destroy
  end
end
