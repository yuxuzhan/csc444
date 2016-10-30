class ProfilesController < ApplicationController
    before_action :authenticate_account!

    def show
        account = Account.find_by id: current_account.id

        @profile = Profile.new
        @profile.name = account.name
        @profile.email = account.email
        @profile.birth = account.birth
        @profile.gender = get_gender_name(account.gender)
        @profile.phone_number = account.phone_number
        @profile.tournaments_played = Hash.new
        @profile.tournaments_orgnized = Hash.new

        get_played_tournaments
        get_orgnized_tournaments
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
        organizers = Organizer.where(account_id: current_account.id)
        organizers.each do |organizer|
            tournament_id = organizer.tournament_id
            tournament_obj = Tournament.find_by id: tournament_id
            tournament_name = tournament_obj.name
            @profile.tournaments_orgnized[tournament_id] = tournament_name
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
                  :tournaments_orgnized
end
