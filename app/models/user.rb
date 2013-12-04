class User < ActiveRecord::Base
	has_many :boards, dependent: :destroy

	#Regex for valid email address
	VALID_EMAIL = /\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)\z/i
	before_save { self.email = email.downcase }
	before_create :create_user_token
	validates :name, presence: true, length: { maximum: 40 }
	validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 8 }

	has_secure_password

	def User.new_user_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_user_token
			self.user_token = User.encrypt(User.new_user_token)
		end

end
