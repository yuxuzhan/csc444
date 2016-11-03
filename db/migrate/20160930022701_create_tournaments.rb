class CreateTournaments < ActiveRecord::Migration[5.0]
    def change
        create_table :tournaments do |t|
            t.string :name
            t.string :venue
            t.string :details
            t.string :contact
            t.boolean :private
            t.date :date
            
            t.timestamps
        end
    end
end
