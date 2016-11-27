class AddAdminToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :admin, :boolean, default: false
  end
end
