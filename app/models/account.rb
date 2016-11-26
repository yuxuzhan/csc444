class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :image, ImageUploader
  before_save :downcase_email
  after_create :send_mail


  def send_mail
  	UserMailer.signup_email(self).deliver
  end

  def downcase_email
  	self.email.downcase!
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#More information on https://www.sitepoint.com/devise-authentication-in-depth/

  # User Image Validation
  validates_integrity_of  :image
  validates_processing_of :image
  private
  #check size of account image
   def image_size_validation
     errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
   end
end
