class TournamentsController < ApplicationController
    before_action :authenticate_account!, except: [:show, :index]

    def index
        @tournaments = Tournament.all
        @tournaments_orgnized = get_editable_tournaments
        @tournaments_players_count = Hash.new
        get_numberofplayers_in_tournament
        @tournaments_organizer = Hash.new
        get_tournaments_organizer

    end

    def new
        @tournament = Tournament.new
    end

    def show
        @tournament_detail = Tournament.where(id: params[:tournament_id])
    end

    def create
        @tournament = Tournament.new(tournament_params)
        if @tournament.save
            @org = Organizer.new
            @org.tournament_id = @tournament.id
            @org.account_id = current_account.id
            @org.admin = true

            if @org.save
                redirect_to home_show_path, notice: 'Tournament created'
            else
                render 'new', notice: 'Invalid'
            end
        else
            render 'new', notice: 'Invalid'
        end
    end

    def edit
        @tournament = Tournament.find(params[:id])

        @user = Organizer.where(account_id: current_account.id, tournament_id: params[:id])
        if @user.blank?
            flash[:notice] = 'You are not the tournament organizer'
            redirect_to tournaments_index_path
        end
    end

    def update
        @tournament = Tournament.find(params[:id])
        @tournament.update(tournament_params)
        redirect_to tournaments_index_path
    end

    def tournament_params
        params.require(:tournament).permit(:name, :venue, :details, :contact, :private, :date)
    end

    def get_editable_tournaments
        arr = []
        if !current_account.nil?
            orgnizers = Organizer.where(account_id: current_account.id)
            orgnizers.each do |orgnizer|
                arr << orgnizer.tournament_id
            end
        end
        return arr
    end

    def get_numberofplayers_in_tournament
        tournaments = Tournament.all
        tournaments.each do |tournament|
            number = 0
            players = Player.where(tournament_id: tournament.id)
            players.each do |player|
                number += 1
            end
            @tournaments_players_count[tournament] = number
        end
    end

    def get_tournaments_organizer
      tournaments = Tournament.all
      tournaments.each do |tournament|
          number = 0
          organizer = Organizer.where(tournament_id: tournament.id, admin: true)
          organizer.each do |organizer|
              @tournaments_organizer[tournament] = organizer.account_id
              #account_obj = Account.find_by id: organizer.account_id
              #@tournaments_organizer[tournament] = account_obj.name
          end
      end
    end
end
