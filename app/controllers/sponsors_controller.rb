class SponsorsController < ApplicationController
    before_action :authenticate_account!, except: [:show]

    def show
    end

    def new
        cookies[:tournament_id] = params[:tournament_id]
        @sponsor = Sponsor.new
    end

    def create
        @sponsor = Sponsor.new(sponsor_params)
        @sponsor.account_id = current_account.id
        if @sponsor.save
          tournament_id = cookies[:tournament_id]
          cookies.delete :tournament_id
          redirect_to sponsorships_new_path(:tournament_id => tournament_id), notice: 'Sponsor created'
        else
          render 'new', notice: 'Invalid'
        end
    end

    def sponsor_params
        params.require(:sponsor).permit(:name, :website, :logo, :business_phone_number, :business_email, :contact)
    end


end
