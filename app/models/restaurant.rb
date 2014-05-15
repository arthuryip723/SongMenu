class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :users
	has_many :courses
	has_many :tables
	# has_many :bills
	has_many :bills, :through => :tables
	validates :name, presence: true, length: { maximum: 140}
	validates :user_id, presence: true
end
