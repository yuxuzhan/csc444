class ProfilesController < ApplicationController
    before_action :authenticate_account!

    def show
        @account = Account.find_by id: current_account.id
        @account.gender = returnGender(@account.gender)
        @player = Player.where(account_id: current_account.id)
        @organizer = Organizer.where(account_id: current_account.id)
    end

    def returnGender(genderInput)
        if genderInput == 'm'
            'Male'
        else
            'Female'
        end
    end
end

class Profile
  attr_accessor :name, :email, :birth, :gender
end
