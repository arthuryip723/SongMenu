class Course < ActiveRecord::Base
	belongs_to :restaurant
	has_many :items
	validates :name, presence: true
	validates :price, presence: true
	validates :restaurant_id, presence: true
end
