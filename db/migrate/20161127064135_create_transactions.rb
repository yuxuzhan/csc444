class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :tournament_id
      t.string :amount
      t.string :stripe_token

      t.timestamps
    end
  end
end
