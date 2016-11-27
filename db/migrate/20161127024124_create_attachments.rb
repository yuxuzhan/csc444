class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.integer  :tournament_id
      t.string   :avatar
      t.timestamps
    end
  end
end
