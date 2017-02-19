class Menu < ActiveRecord::Base

	has_many :menutypes
	belongs_to :restaurant
	belongs_to :cuisine
end
