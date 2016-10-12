class SponsorsController < ApplicationController
  before_action :authenticate_account!, :except => [:show]

  def show
    @sponsor_detail = Sponsor.all
  end

  def create
  	@sponsor = Sponsor.new
    @sponsor.account_id = current_account.id
    @sponsor.name = params[:name]
    @sponsor.website = params[:website]
    @sponsor.contact = params[:contact]

    @duplicate_sponsor = Sponsor.where(account_id: current_account.id, name: params[:name])
    #a user cannot create two sponsor entry with the same sponsor name
    if @duplicate_sponsor.blank?
      if @sponsor.save
        redirect_to sponsors_index_path, :notice => 'Sponsor created'
      else
        render 'new', :notice => 'Invalid'
      end
    else
        redirect_to sponsors_index_path, :notice => 'Already a sponsor'
    end
  end

end
