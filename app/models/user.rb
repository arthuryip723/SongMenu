class User < ActiveRecord::Base
	has_many :restaurants
	belongs_to :restaurant
	validates :name, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
						format: { with: VALID_EMAIL_REGEX},
						uniqueness: { case_sensitive: false}
	validates :password, length: { minimum: 6}
	# make the role be in ROLES
	validates :role, presence: true, inclusion: {in: %w{admin default manager cashier cook waiter guest}}
	# if not admin or manager, restaurant_id must be present
	# validates :restaurant_id, presence: true, :unless => lambda { self.role == 'manager'}
	validates :restaurant_id, presence: true, :unless => "role == 'manager'"
	has_secure_password
	before_save { self.email = email.downcase}
	# before_create :create_remember_token

	def User.new_remember_token
	    SecureRandom.urlsafe_base64
	end

	def User.hash(token)
    	Digest::SHA1.hexdigest(token.to_s)
	end

	  # Roles = [ :admin , :default ]
	  ROLES = %w[admin default manager cashier cook waiter guest]

  def is?( requested_role )
    # self.role == requested_role.to_s
    self.role == requested_role
  end

  def admin?
  	self.role == 'admin'
  end



	# private

	#     def create_remember_token
	#       self.remember_token = User.hash(User.new_remember_token)
	#     end
end
