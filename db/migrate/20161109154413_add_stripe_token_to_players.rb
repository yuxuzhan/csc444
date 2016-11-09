class AddStripeTokenToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :stripe_token, :string
  end
end
