class Photo < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo

  validates_presence_of :user

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 1.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
  
  private
  
  def validate
    errors.add(:photo, "You can't have more than 10 photos.") if self.user.photos.size >= 10
  end
end
