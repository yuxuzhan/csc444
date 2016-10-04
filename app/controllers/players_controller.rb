class PlayersController < ApplicationController

before_action :authenticate_account!, :except => [:show, :index]

def create
  	@player = Player.new
  	@player.tournament_id = params[:tournament_id]
  	@player.account_id = current_account.id
  	#don't know what to do for groups and checkin yet


  	if @player.save
  		redirect_to tournaments_index_path, :notice => 'Joined Tournament'
  	else
  		render 'new', :notice => 'Invalid'
  	end
  end

def show
    @player_info =  Player.where(tournament_id = params[:tournament_id])

  #  @player_info = Player.all

  end

end
