class CreateSubAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_admins do |t|
      t.integer :tournament_id
      t.integer :account_id
      t.timestamps
    end
  end
end
