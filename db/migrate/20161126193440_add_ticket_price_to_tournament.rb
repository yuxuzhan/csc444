class AddTicketPriceToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :ticket_price, :integer
    add_column :tournaments, :ticket_price_guest, :integer
  end
end
