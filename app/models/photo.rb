class Photo < ActiveRecord::Base
  attr_accessible :file,
                  :user_id

  belongs_to :user

  validates :file, presence: true
  validates :user_id, presence: true

  mount_uploader :file, PhotoUploader
end
