class Course < ActiveRecord::Base
	belongs_to :restaurant
	validates :name, presence: true
	validates :user_id, presence: true
end
