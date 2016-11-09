class SponsorsController < ApplicationController
    before_action :authenticate_account!, except: [:show]

    def show
    end

    def new
        cookies[:tournament_id] = params[:tournament_id]
        @sponsor = Sponsor.new
    end

    def create
      @amount = params[:amount]
      @amount = @amount.gsub('$', '').gsub(',', '')
      tournament_id = cookies[:tournament_id]

      begin
        @amount = Float(@amount).round(2)
        @amount = (@amount * 100).to_i # Must be an integer!
        @sponsor = Sponsor.new
        @sponsor.name = params[:name]
        @sponsor.website = params[:website]
        @sponsor.logo = params[:logo]
        @sponsor.business_phone_number = params[:business_phone_number]
        @sponsor.business_email = params[:business_email]
        @sponsor.contact = params[:contact]
        @sponsor.account_id = current_account.id
        if @sponsor.save
          Stripe::Charge.create(
            :amount => @amount,
            :currency => 'cad',
            :source => params[:stripeToken],
            :description => 'Custom donation'
          )
          @sponsorship = Sponsorship.new
          @sponsorship.sponsor_id = @sponsor.id
          @sponsorship.tournament_id = tournament_id
          @sponsorship.amount = params[:amount]
          @sponsorship.stripe_token = params[:stripeToken]
          @sponsorship.save
          cookies.delete :tournament_id
          redirect_to tournaments_show_path(:tournament_id => tournament_id), notice: 'Sponsor created'
        else
          render 'new', notice: 'Invalid'
        end
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to sponsors_new_path(:tournament_id => tournament_id)
      end
    end

end
