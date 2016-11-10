class UserMailer < ApplicationMailer
	default from: 'csc444.golfi@gmail.com'

	def signup_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to GOLFi!')
	end
end
