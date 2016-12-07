class SubAdminsController < ApplicationController

    def create
        @sub_admin = SubAdmin.new
        if params[:sub_admin][:approve] == "true"
            @sub_admin.tournament_id = params[:tournament_id]
            @sub_admin.account_id = params[:account_id]
            @duplicate_sub_admin = SubAdmin.where(tournament_id: params[:tournament_id], account_id: params[:account_id])
            if @duplicate_sub_admin.blank?
                if @sub_admin.save
                    redirect_to organizers_show_path
                end
            else
                redirect_to organizers_show_path
            end
        end

        if params[:sub_admin][:approve] == "false"
            @del_sub_admin = SubAdmin.where(tournament_id: params[:tournament_id], account_id: params[:account_id])
            if @del_sub_admin.present?
                @del_sub_admin.each do |del_sub_admin|
                    del_sub_admin.destroy
                end
                redirect_to organizers_show_path
            else
                redirect_to organizers_show_path
            end
        end
    end

    def show
        @arrangement = Arrangement.new
        @arrangement.tournaments_sub_admin = Hash.new
        get_played_players
    end

    def get_played_players
        sub_admins = SubAdmin.where(account_id: current_account.id)
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
