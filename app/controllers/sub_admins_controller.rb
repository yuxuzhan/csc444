class SubAdminsController < ApplicationController

    def show
        @arrangement = Arrangement.new
        @arrangement.tournaments_sub_admin = Hash.new
        get_played_players
    end

    def get_played_players
        sub_admins = Sub_admin.where(account_id: current_account.id)
        sub_admins.each do |sub_admin|
            tournament_id = sub_admin.tournament_id
            tournament_obj = Tournament.find_by id: tournament_id
            tournament_name = tournament_obj.name
            player_info = Player.where(tournament_id: tournament_id)
            @arrangement.tournaments_sub_admin[tournament_name] = player_info
        end
      end
end

class Arrangement
    attr_accessor :tournaments_sub_admin
end
