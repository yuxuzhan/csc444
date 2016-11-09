class PlayersController < ApplicationController
    before_action :authenticate_account!, except: [:show, :index]

    def create
      begin
        Stripe::Charge.create(
          :amount => params[:amount],
          :currency => 'cad',
          :source => params[:stripeToken],
          :description => 'Ticketing'
        )
        @player = Player.new
        @player.tournament_id = params[:tournament_id]
        @player.account_id = current_account.id
        @duplicate_player = Player.where(tournament_id: params[:tournament_id], account_id: current_account.id)

        @tournament = Tournament.find_by id: params[:tournament_id]
        if @duplicate_player.blank?
            if @player.save
                redirect_to tournaments_index_path, notice: 'Joined Tournament'
                @tournament.slots = @tournament.slots-1
                @tournament.save
            else
                render 'new', notice: 'Invalid'
            end
        else
            redirect_to tournaments_index_path, notice: 'Already in Tournament'
        end
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      end
    end

    def show
        @player_info = Player.where(tournament_id: params[:tournament_id])
    end

    def update
        if params[:player][:group_id].present?
            @player = Player.where(account_id: params[:account_id],tournament_id: params[:tournament_id])
            @player.update(group_id: params[:player][:group_id])
            redirect_to profiles_show_path
        end
        if params[:player][:checkin].present?
            @player = Player.where(account_id: params[:account_id],tournament_id: params[:tournament_id])
            @player.update(checkin: params[:player][:checkin])
            redirect_to profiles_show_path
        end
    end

end
