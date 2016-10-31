class SponsorsController < ApplicationController
    before_action :authenticate_account!, except: [:show]

    def show
        @sponsor_detail = Sponsor.all
    end

    def new
        @sponsor = Sponsor.new
    end

    def create
        @sponsor = Sponsor.new(sponsor_params)
        @sponsor.account_id = current_account.id
        if @sponsor.save
          redirect_to tournaments_index_path, notice: 'Sponsor created'
        else
          render 'new', notice: 'Invalid'
        end
    end

    def sponsor_params
        params.require(:sponsor).permit(:name, :website, :business_phone_number, :business_email, :contact)
    end


end
