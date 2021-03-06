class User < ActiveRecord::Base
	has_many :items
	
	before_save { self.email = email.downcase }
	# hash around maximum required to remove ambiguity
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+.\-]+@[a-z\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }
	has_secure_password
	validates :password, length: {minimum: 6}


	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	geocoded_by :location
	after_validation :geocode

end
