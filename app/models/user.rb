class User < ActiveRecord::Base
	has_many :restaurants
	validates :name, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
						format: { with: VALID_EMAIL_REGEX},
						uniqueness: { case_sensitive: false}
	validates :password, length: { minimum: 6}
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
