class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :marital_status
  belongs_to :body_type
end
