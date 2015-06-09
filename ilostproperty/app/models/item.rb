class Item < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true, length: {maximum: 50}

	validates :location_lost, presence: true, length: {maximum: 50}

	validates :reward, presence: true, :numericality => { :greater_than => 19}

	geocoded_by :location_lost
	after_validation :geocode
end
