class TournamentsController < ApplicationController
  def new
  	@tournament = Tournament.new
  end

  def create
  	@tournament = Tournament.new(tournament_params)

  	if @tournament.save
  		redirect_to home_show_path, :notice => 'Tournament created'
  	else
  		render 'new', :notice => 'Invalid'
  	end
  end

  def tournament_params
  	params.require(:tournament).permit(:name, :venue, :details, :contact, :private, :date)
  end
end
