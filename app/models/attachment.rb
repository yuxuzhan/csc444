class Attachment < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
	belongs_to :tournament
  validates 	:tournament, presence: true

end
