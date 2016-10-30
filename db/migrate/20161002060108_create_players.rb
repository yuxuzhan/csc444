class CreatePlayers < ActiveRecord::Migration[5.0]
    def change
        create_table :players do |player|
            player.integer :account_id
            player.integer :tournament_id
            player.integer :group_id
            player.boolean :checkin
            player.timestamps
        end
    end
end
