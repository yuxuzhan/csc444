class TransactionsController < ApplicationController

    def create
        begin
        Stripe::Charge.create(
            :amount => params[:guest_amount],
            :currency => 'cad',
            :source => params[:stripeToken],
            :description => 'Ticketing From Guests'
        )
        @tournament = Tournament.find(params[:guest_tournament_id])
        @transaction = @tournament.transactions.create(amount:params[:guest_amount],stripe_token:params[:stripeToken])
        @user = Account.find_by id: current_account.id

        @player = Player.where(tournament_id: params[:guest_tournament_id], account_id: current_account.id)
        if @transaction.save
            UserMailer.guest_email(@tournament,@transaction,@user).deliver
            redirect_to tournaments_path
        end

        rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to new_charge_path
        end


    end


end
