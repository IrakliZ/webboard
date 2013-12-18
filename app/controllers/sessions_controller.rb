##
# Class for controlling the sessions

class SessionsController < ApplicationController

	def new
	end

	##
	# Creates a session for an user depending on the information given to the login form.
	# If the information is correct, the uesr is logged in and redirected to the user's show page,
	# otherwise they are redirected to the login page with "Invalid email or password" flash
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash[:danger] = 'Invalid email or password'
			redirect_to root_url
		end
	end

	##
	# Signs an user out upon clicking sign out button and redirects them to login page
	def destroy
		sign_out
		redirect_to root_url
	end

end
