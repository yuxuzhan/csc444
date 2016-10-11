class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.integer :account_id
      t.string :name
      t.string :website
      t.string :logo
      t.string :contact

      t.timestamps
    end
  end
end
