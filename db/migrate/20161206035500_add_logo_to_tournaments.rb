class AddLogoToTournaments < ActiveRecord::Migration[5.0]
  def change
      add_column :tournaments, :logo, :string
  end
end
