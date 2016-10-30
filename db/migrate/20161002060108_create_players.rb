class CreatePlayers < ActiveRecord::Migration[5.0]
    def change
        create_table :players do |t|
            t.integer :account_id
            t.integer :tournament_id
            t.integer :group_id
            t.boolean :checkin
            t.timestamps
        end
    end
end
