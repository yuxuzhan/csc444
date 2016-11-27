class Sponsor < ApplicationRecord
  mount_uploader :logo, LogoUploader
  belongs_to :account
  has_many :sponsorships

  validates 	:account, presence: true
  validates :name, :presence => true
  validates :name, uniqueness: { scope: :account_id,
      message: "You have already created sponsor with name %{value}" }
end
