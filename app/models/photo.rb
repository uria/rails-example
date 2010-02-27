class Photo < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 1.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
end
