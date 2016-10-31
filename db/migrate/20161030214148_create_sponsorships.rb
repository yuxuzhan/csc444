class CreateSponsorships < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsorships do |t|
      t.integer :sponsor_id
      t.integer :tournament_id
      t.integer :amount
      t.timestamps
    end
  end
end
