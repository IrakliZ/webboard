class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy
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
    if current_user != @user
      flash[:danger] = "Access denied"
      redirect_to @user
    end
  end

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

  def show
  	@user = User.find(params[:id])
    @boards = @user.boards.paginate(page: params[:page])
  end

  private

  def permitted_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end 

end
