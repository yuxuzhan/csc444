class ProfilesController < ApplicationController
	before_action :authenticate_account!

	def show
		@account = Account.find_by id: current_account.id
	end
end
