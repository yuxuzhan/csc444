class PlayersController < ApplicationController
    before_action :authenticate_account!, except: [:show, :index]

    def create
      begin
        Stripe::Charge.create(
          :amount => params[:amount],
          :currency => 'cad',
          :source => params[:stripeToken],
          :description => 'Ticketing From Players'
        )

        @player = Player.new
        @player.tournament_id = params[:tournament_id]
        @player.account_id = current_account.id
        @player.stripe_token = params[:stripeToken]
        @duplicate_player = Player.where(tournament_id: params[:tournament_id], account_id: current_account.id)

        @tournament = Tournament.find_by id: params[:tournament_id]
        if @duplicate_player.blank?
            if @player.save
                UserMailer.player_email(@player).deliver
                @tournament.slots = @tournament.slots-1
                @tournament.save
                redirect_to players_show_path(:tournament_id => @player.tournament_id)
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
        if params[:player][:group_id_organizer].present?
            @player = Player.where(account_id: params[:account_id],tournament_id: params[:tournament_id])
            @player.update(group_id: params[:player][:group_id_organizer])
            redirect_to organizers_show_path
        end

        if params[:player][:group_id_subAdmin].present?
            @player = Player.where(account_id: params[:account_id],tournament_id: params[:tournament_id])
            @player.update(group_id: params[:player][:group_id_subAdmin])
            redirect_to sub_admins_show_path
        end


        if params[:player][:ticketnumber].present?
            @player = Player.where(stripe_token: params[:player][:ticketnumber])
            @player.update(checkin: true)
            redirect_to organizers_update_path
        end
    end

end
