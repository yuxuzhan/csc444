class TournamentsController < ApplicationController

	before_action :authenticate_account!, :except => [:show, :index]

  def index
    @tournaments = Tournament.all
  end

  def new
  	@tournament = Tournament.new
  end

	def show
		@tournament_detail = Tournament.where(id: params[:tournamet_id])
	end

  def create
  	@tournament = Tournament.new(tournament_params)

  	if @tournament.save
  		@org = Organizer.new

  		@org.tournament_id = @tournament.id
  		@org.account_id = current_account.id
  		@org.admin = true

  		if @org.save
  			redirect_to home_show_path, :notice => 'Tournament created'
  		else
  			render 'new', :notice => 'Invalid'
  		end
  	else
  		render 'new', :notice => 'Invalid'
  	end
  end
  
  def edit
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
  	params.require(:tournament).permit(:name, :venue, :details, :contact, :private, :date)
  end
end
