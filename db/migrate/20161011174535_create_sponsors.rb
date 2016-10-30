class CreateSponsors < ActiveRecord::Migration[5.0]
    def change
        create_table :sponsors do |t|
            t.integer :account_id
            t.string :name
            t.string :logo
            t.string :contact
            t.string :website
            t.string :business_phone_number
            t.string :business_email
            t.timestamps
        end
    end
end
