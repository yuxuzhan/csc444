class SponsorshipsController < ApplicationController
  before_action :authenticate_account!, except: [:show]

  # GET /sponsorships/1
  # GET /sponsorships/1.json
  def show
    @tournament = Tournament.find(params[:id])
    @sponsorship = @tournament.sponsorships
  end

  # GET /sponsorships/new
  def new
    @sponsorship = Sponsorship.new
    @sponsor = Sponsor.new
    @tournament = params[:tournament_id]
    @user = Account.find(current_account.id)
  end

  # GET /sponsorships/1/edit
  def edit

  end

  # POST /sponsorships
  # POST /sponsorships.json
  def create
    @user = Account.find(current_account)
    if params[:sponsors_id]
      #user used existing sponsor
      @sponsor = @user.sponsors.find(params[:sponsors_id])
    end
    @amount = params[:sponsorship]["amount"]
    @stripe_token = params[:sponsorship]["stripe_token"]
    @tournament = Tournament.find(params[:sponsorship]["tournament_id"])

    begin
      Stripe::Charge.create(
        :amount => @amount,
        :currency => 'cad',
        :source => @stripe_token,
        :description => 'Custom donation'
      )
      @sponsor.sponsorships.create(:amount => @amount, :stripe_token => @stripe_token, :tournament_id => @tournament.id)
      redirect_to @tournament

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_sponsorship_path(:tournament_id => params[:tournament_id])
    end
  end
end
