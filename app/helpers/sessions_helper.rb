##
# Class for making user validation easier

module SessionsHelper

	##
	# Helper function for signing in an user, creating a cookie on the browser, so that when an user leaves
	# without logging off and returns, they will still be logged in.
	def sign_in(user)
		user_token = User.new_user_token
		cookies.permanent[:user_token] = user_token
		user.update_attribute(:user_token, User.encrypt(user_token))
		self.current_user = user
	end

	##
	# Helper function for signing out an user and deleting the cookie stored for signed in users
	def sign_out
		self.current_user = nil
		cookies.delete(:user_token)
	end

	##
	# Helper function for setting the current user to a certain user
	def current_user=(user)
		@current_user = user
	end

	##
	# Helper function for getting the current logged in user
	def current_user
		user_token = User.encrypt(cookies[:user_token])
		@current_user ||= User.find_by(user_token: user_token)
  end

  ##
  # Helper functionn for checking if an user is currently logged in
  def current_user?(user)
    user == current_user
  end

  ##
  # Helper function for checking if somebody is logged in
	def signed_in?
		!current_user.nil?
	end

end
