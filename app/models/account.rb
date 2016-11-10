class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

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
end
