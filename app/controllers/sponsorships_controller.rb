class SponsorshipsController < ApplicationController
  before_action :authenticate_account!, except: [:show]

  # GET /sponsorships
  # GET /sponsorships.json
  def index

  end

  # GET /sponsorships/1
  # GET /sponsorships/1.json
  def show
  end

  # GET /sponsorships/new
  def new
    cookies[:tournament_id] = params[:tournament_id]
    @sponsorship = Sponsorship.new
  end

  # GET /sponsorships/1/edit
  def edit

  end

  # POST /sponsorships
  # POST /sponsorships.json
  def create
    @amount = params[:amount]

    @amount = @amount.gsub('$', '').gsub(',', '')

    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
      redirect_to new_charge_path
      return
    end

    @amount = (@amount * 100).to_i # Must be an integer!

    if @amount < 500
      flash[:error] = 'Charge not completed. Donation amount must be at least $5.'
      redirect_to new_charge_path
      return
    end

    Stripe::Charge.create(
      :amount => @amount,
      :currency => 'cad',
      :source => params[:stripeToken],
      :description => 'Custom donation'
    )
    tournament_id = cookies[:tournament_id]
    @sponsorship =  Sponsorship.new
    @sponsorship.sponsor_id = params[:sponsors]["sponsor_id"]
    @sponsorship.tournament_id = tournament_id
    @sponsorship.amount = params[:amount]
    @sponsorship.stripe_token = params[:stripeToken]
    @sponsorship.save
    cookies.delete :tournament_id
    redirect_to tournaments_show_path(:tournament_id => tournament_id)

  end

end
