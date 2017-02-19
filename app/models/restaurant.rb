class Restaurant < ActiveRecord::Base

    belongs_to :user
    has_many :menus
    has_many :reviews
	has_many :restaurant_cuisines
	has_many :cuisines, through: :restaurant_cuisines

	belongs_to :location
	belongs_to :city

	validates_presence_of :name, :city_id, :location, :cost_for_two
	validates_numericality_of :mobile

	mount_uploader :cover, CoverUploader

end
