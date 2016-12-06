class ProfilesController < ApplicationController
    before_action :authenticate_account!

    def show
        @profile = Profile.new
        @profile.tournaments_played = Hash.new
        @profile.tournaments_orgnized = Hash.new
        @profile.tournaments_sub_admin = Hash.new
        get_account_info
        get_played_tournaments
        get_orgnized_tournaments
        get_sub_admin_tournaments
    end

    def get_account_info
        account = Account.find_by id: current_account.id

        @profile.name = account.name
        @profile.email = account.email
        @profile.birth = account.birth
        @profile.gender = get_gender_name(account.gender)
        @profile.phone_number = account.phone_number
        @profile.image = account.image
    end

    def get_gender_name(gender)
        if gender == 'm'
            'Male'
        else
            'Female'
        end
    end

    def get_played_tournaments
        players = Player.where(account_id: current_account.id)
        players.each do |player|
            tournament_id = player.tournament_id
            tournament_obj = Tournament.find_by id: tournament_id
            tournament_name = tournament_obj.name
            @profile.tournaments_played[tournament_id] = tournament_name
        end
    end

    def get_orgnized_tournaments
        if(!current_account.admin)
            organizers = Organizer.where(account_id: current_account.id)
        else
            organizers = Organizer.all
        end
        organizers.each do |organizer|
            tournament_id = organizer.tournament_id
            tournament_obj = Tournament.find_by id: tournament_id
            tournament_name = tournament_obj.name
            @profile.tournaments_orgnized[tournament_id] = tournament_name
        end
    end

    def get_sub_admin_tournaments
        sub_admins = SubAdmin.where(account_id: current_account.id)
        sub_admins.each do |sub_admin|
            tournament_id = sub_admin.tournament_id
            tournament_obj = Tournament.find_by id: tournament_id
            tournament_name = tournament_obj.name
            @profile.tournaments_sub_admin[tournament_id] = tournament_name
        end
    end
end

class Profile
    attr_accessor :name,
                  :email,
                  :birth,
                  :gender,
                  :phone_number,
                  :tournaments_played,
                  :tournaments_orgnized,
                  :tournaments_sub_admin,
                  :image
end
