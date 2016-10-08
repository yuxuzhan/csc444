class ProfilesController < ApplicationController
	before_action :authenticate_account!

	def show
		@account = Account.find_by id: current_account.id
		@player = Player.where(account_id: current_account.id)
		@organizer = Organizer.where(account_id: current_account.id)
	end
end
