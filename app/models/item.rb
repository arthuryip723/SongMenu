class Item < ActiveRecord::Base
	extend Enumerize
	belongs_to :bill
	belongs_to :course

	# enum status: [:ordered, :finished, :served]
	enumerize :status, in: {:ordered => 0, :prepared => 1, :served => 2}, default: :ordered
end
