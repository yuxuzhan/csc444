class Sponsor < ApplicationRecord
  validates :name, :presence => true
  validates :name, uniqueness: { scope: :account_id,
      message: "You have already created sponsor with name %{value}" }
end
