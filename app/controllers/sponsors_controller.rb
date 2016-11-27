class SponsorsController < ApplicationController
    before_action :authenticate_account!, except: [:show]

    def show
      @sponsor = Sponsor.find(params[:id])
    end

    def create
      @user = Account.find(current_account.id)
      @user.sponsors.create(sponsor_params)
      redirect_to :back
    end


    def sponsor_params
      params.require(:sponsor).permit(:name, :website, :logo, :contact)
    end

end
