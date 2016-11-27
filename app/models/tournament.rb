class Tournament < ApplicationRecord
	has_many :attachments, :inverse_of => :tournament, :dependent => :destroy
<<<<<<< Updated upstream
	has_many :transactions
=======
>>>>>>> Stashed changes
	has_many :sponsorships

	validates :name, :presence => true
	validates :venue, :presence => true
	validates :details, :presence => true
	validates :contact, :presence => true
	validates :date, :presence => true
	validates :slots, :presence => true
	validates :ticket_price, :presence => true
	validates :ticket_price_guest, :presence => true
end
