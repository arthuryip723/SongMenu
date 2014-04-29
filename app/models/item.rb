class Item < ActiveRecord::Base
	belongs_to :bill
	belongs_to :course
end
