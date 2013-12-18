##
# Class for controlling all the users

class UsersController < ApplicationController
  ##
  # If there are many users to be displayed, it will be split up into different pages
  # that can be traversed through a list of links
  require "will_paginate-bootstrap"

  ##
  # Required for the signup page
  def new
  	@user = User.new
  end

  ##
  # Creates an user using the information provided in the signup form. If the information is correct,
  # the user is created, logged-in and redirected to their user path. Otherwise (if the email has already
  # been used, invalid email, password and confirmation not matching, or password too short), they are
  # redirected to the signup page.
  def create
  	@user = User.new(permitted_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to Webboard!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  ##
  # Lists all the users that have been signed up. If there are too many, the users are
  # split up into different pages using pagination
  def index
    @users = User.paginate(page: params[:page])
  end

  ##
  # Allows users to edit their information after creating their account.
  def edit
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = "Access denied"
      redirect_to @user
    end
  end

  ##
  # Allows users to edit their information after creating their account. If the user that is
  # trying to access the edit page isn't the current user, they are redirected to the user's
  # show page with a danger flash "Access denied"
  def update
    @user = User.find(params[:id])
    if current_user != @user
      flash[:danger] = "Access denied"
      redirect_to @user
    else
      if @user.update_attributes(permitted_params)
        flash[:success] = "User information updated"
        redirect_to @user
      else
        render 'edit'
      end
    end
  end

  ##
  # Lists all the baords that belong to the user, along with name and gravatar
  def show
  	@user = User.find(params[:id])
    @boards = @user.boards.paginate(page: params[:page])
    @new_board = @user.boards.build
  end

  private

  def permitted_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
