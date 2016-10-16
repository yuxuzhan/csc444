class Tournament < ApplicationRecord
	validates :name, :presence => true
	validates :venue, :presence => true
	validates :details, :presence => true
    validates :contact, :presence => true
    validates :date, :presence => true

end
