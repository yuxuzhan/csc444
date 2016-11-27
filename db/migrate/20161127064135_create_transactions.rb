class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :tournament_id, foreign_key: true

      t.timestamps
    end
  end
end
