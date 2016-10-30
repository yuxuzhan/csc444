class OrganizersController < ApplicationController
    def new
        @organizer = Organizer.new
    end

    def show
        @arrangement = Arrangement.new
        @arrangement.tournaments_created = Hash.new
        get_played_players
    end

    def get_played_players
        organizer = Organizer.where(account_id: current_account.id)
        organizer.each do |organizer|
            tournament_id = organizer.tournament_id
            tournament_obj = Tournament.find_by id: tournament_id
            tournament_name = tournament_obj.name
            player_info = Player.where(tournament_id: tournament_id)
            @arrangement.tournaments_created[tournament_name] = player_info
        end
      end
end

class Arrangement
    attr_accessor :tournaments_created
end
