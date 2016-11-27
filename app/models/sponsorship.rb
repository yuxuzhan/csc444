class Sponsorship < ApplicationRecord
  belongs_to :sponsor
  belongs_to :tournament

  validates 	:tournament, presence: true
  validates 	:tournament, presence: true
end
