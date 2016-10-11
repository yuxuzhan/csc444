class SponsorsController < ApplicationController
  def create
    reate_table :sponsors do |t|
      t.integer :account_id
      t.string :name
      t.string :website
      t.string :logo
      t.string :contact
      @sponsor = Sponsor.new
      @sponsor.account_id = current_account.id
      @sponsor.name = params[:name]
      @sponsor.contact = params[:contact]
      @sponsor.website = params[:website]

      @duplicate_sponsor = Player.where(name: params[:name], account_id: current_account.id)
      if @duplicate_sponsor.blank?
        if @sponsor.save
          redirect_to tournaments_index_path, :notice => 'Become Sponsor, Please make a payment'
        else
          render 'new', :notice => 'Invalid'
        end
      else
          redirect_to tournaments_index_path, :notice => 'Already a sponsor'
      end
  end

end
