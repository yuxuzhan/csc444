class TournamentsController < ApplicationController
    before_action :authenticate_account!, except: [:show, :index]

    def index
        @tournaments = Tournament.all
        @tournaments_orgnized = get_editable_tournaments
        @tournaments_players_count = {}
        get_number_of_players_in_tournament
        @tournaments_organizer = {}
        get_tournaments_organizer
    end

    def new
        @tournament = Tournament.new
    end

    def show
        @tournament = Tournament.find(params[:id])
        @avaliable_spots = get_available_spots
        @tournaments_orgnized = get_editable_tournaments
    end

    def create
        @tournament = Tournament.new(tournament_params)
        if @tournament.save
            if params[:avatars]
                params[:avatars].each do |a|
                    @tournament.attachments.create(avatar: a)
                end
            end
            @org = Organizer.new
            @org.tournament_id = @tournament.id
            @org.account_id = current_account.id
            @org.admin = true

            if @org.save
                redirect_to tournament_path(@org.tournament_id), notice: 'Tournament created'
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
        if @user.blank? && !current_account.admin
            flash[:notice] = 'You are not the tournament organizer'
            redirect_to tournaments_path
        end
    end

    def update
        @tournament = Tournament.find(params[:id])
        if @tournament.update(tournament_params)
            # to handle multiple images upload on update when user add more picture
            if params[:avatars]
                params[:avatars].each do |a|
                    @tournament.attachments.create(avatar: a)
                end
            end
            flash[:notice] = 'Tournament has been updated.'
            redirect_to @tournament
        else
            render :edit
        end
    end

    def destroy
        @tournament = Tournament.find(params[:id])
        @tournament.destroy

        redirect_to tournaments_path
    end

    def tournament_params
        params.require(:tournament).permit(:name, :venue, :details, :contact, :private, :date, :slots, :ticket_price, :ticket_price_guest)
    end

    def get_editable_tournaments
        arr = []
        unless current_account.nil?
            orgnizers = Organizer.where(account_id: current_account.id)
            orgnizers.each do |orgnizer|
                arr << orgnizer.tournament_id
            end
        end
        arr
    end

    def get_available_spots
        player_count = 0
        players = Player.where(tournament_id: @tournament.id)
        players.each do |_player|
            player_count += 1
        end
        available_slots = @tournament.slots - player_count
        if available_slots >= 0
            return available_slots
        else
            return "N/A"
        end
    end

    def get_number_of_players_in_tournament
        tournaments = Tournament.all
        tournaments.each do |tournament|
            number = 0
            players = Player.where(tournament_id: tournament.id)
            players.each do |_player|
                number += 1
            end
            @tournaments_players_count[tournament] = number
        end
    end

    def get_tournaments_organizer
        tournaments = Tournament.all
        tournaments.each do |tournament|
            organizer = Organizer.where(tournament_id: tournament.id, admin: true)
            organizer.each do |organizer|
                # @tournaments_organizer[tournament] = organizer.account_id
                # Nedd to find a way to get name by account_id from Devise.
                account_obj = Account.find_by id: organizer.account_id
                @tournaments_organizer[tournament] = account_obj.name
            end
        end
    end
end
