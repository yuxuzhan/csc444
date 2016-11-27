class Tournament < ApplicationRecord
	has_many :attachments, :inverse_of => :tournament, :dependent => :destroy
	has_many :transactions
	has_many :sponsorships, :dependent => :destroy
	has_many :sub_admins, :dependent => :destroy
	has_many :players, :dependent => :destroy
	has_one :organizer, :dependent => :destroy

	validates :name, :presence => true
	validates :venue, :presence => true
	validates :details, :presence => true
	validates :contact, :presence => true
	validates :date, :presence => true
	validates :slots, :presence => true
	validates :ticket_price, :presence => true
	validates :ticket_price_guest, :presence => true
end
