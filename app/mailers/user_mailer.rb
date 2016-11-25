class UserMailer < ApplicationMailer
	default from: 'csc444.golfi@gmail.com'

	def signup_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to GOLFi!')
	end

	def player_email(player)
		@player = player
		@user = Account.find_by id: @player.account_id
		@tournament = Tournament.find_by id: @player.tournament_id
		mail(to: @user.email, subject: 'You have signed up for a tournament!')
	end

	def sponsorship_email(sponsorship)
		@sponsorship = sponsorship
		@sponsor = Sponsor.find_by id: @sponsorship.sponsor_id
		@user = Account.find_by id: @sponsor.account_id
		@tournament = Tournament.find_by id: @sponsorship.tournament_id
		mail(to: @user.email, subject: 'You have sponsored a tournament!')
	end

	def contact_us_email(contact)
		@contact = contact

		mail(to: 'csc444.golfi@gmail.com', subject: 'User Feedback')
	end

end
