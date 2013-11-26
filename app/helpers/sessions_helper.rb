module SessionsHelper

	def sign_in(user)
		user_token = User.new_user_token
		cookies.permanent[:user_token] = user_token
		user.update_attribute(:user_token, User.encrypt(user_token))
		self.current_user = user
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:user_token)
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		user_token = User.encrypt(cookies[:user_token])
		@current_user ||= User.find_by(user_token: user_token)
	end

	def signed_in?
		!current_user.nil?
	end

end
