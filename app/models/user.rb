class User < ActiveRecord::Base

	#Regex for valid email address
	VALID_EMAIL = /\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)\z/i

	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 40 }
	validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 8 }

	has_secure_password
	def self.authenticate (login, pass)
		u=find(:first, :conditions=> ["login = ?", login])
		return nil if u.nil? 
		return u if User.hash_password(pass, u.password)==u.password
		nil
	end 

end
