class Course < ActiveRecord::Base
	include Paperclip::Glue
	belongs_to :restaurant
	has_many :items
	validates :name, presence: true
	validates :price, presence: true
	validates :restaurant_id, presence: true

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
