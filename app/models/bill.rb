class Bill < ActiveRecord::Base
	extend Enumerize
	# belongs_to :restaurant
	belongs_to :table
	# belongs_to :restaurant, :through => :tables
	has_many :items

	# enum status: [:ordered, :served, :paid]
	# ORDERED = 0
	# SERVED = 1
	# PAID = 2
	# STATUS = {:ordered => ORDERED, :served => SERVED, :paid => PAID}
	# attr_accessible :status
	# enumerize :status, in: [:ordered, :served, :paid], default: :ordered
	enumerize :status, in: {:ordered => 0, :served => 1, :paid => 2}, default: :ordered
	# enumerize :status, in: {:ordered => 0, :served => 1, :paid => 2}
end
