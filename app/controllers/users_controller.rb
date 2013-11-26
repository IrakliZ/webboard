class UsersController < ApplicationController
  def new
  	@user = User.new
  end

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

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(permitted_params)
      flash[:success] = "User information updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def permitted_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
