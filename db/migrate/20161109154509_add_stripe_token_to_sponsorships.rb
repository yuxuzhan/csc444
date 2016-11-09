class AddStripeTokenToSponsorships < ActiveRecord::Migration[5.0]
  def change
    add_column :sponsorships, :stripe_token, :string
  end
end
