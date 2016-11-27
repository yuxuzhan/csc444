class Tournament < ApplicationRecord
	has_many :attachments, :inverse_of => :tournament, :dependent => :destroy

	validates :name, :presence => true
	validates :venue, :presence => true
	validates :details, :presence => true
	validates :contact, :presence => true
	validates :date, :presence => true
	validates :slots, :presence => true
	validates :ticket_price, :presence => true
end
