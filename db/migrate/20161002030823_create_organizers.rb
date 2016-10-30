class CreateOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizers do |t|
    	t.integer :tournament_id
    	t.integer :account_id
    	t.boolean :admin
      t.timestamps
    end
  end
end
