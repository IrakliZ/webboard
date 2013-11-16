class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	  	@user = User.new(permitted_params)
  	if @user.save
  		flash[:success] = "Welcome to Webboard!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def index
  end

  def edit
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def permitted_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
