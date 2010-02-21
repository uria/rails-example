class User < ActiveRecord::Base
  has_one :profile
  acts_as_authentic

  before_create :create_profile

  def create_profile
    self.profile = Profile.new
  end
end
