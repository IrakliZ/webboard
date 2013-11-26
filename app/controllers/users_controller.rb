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

  def login 
      if request.post? 
        user = User.authenticate(params[:user][:login],
                                        [:user][:password])
      if user 
          session[:user] = user.id 
          #flash[:notice]  = "Login successful" 
          redirect_to :controller=>'user', :action=>'home'
      else 
          flash[:error] = "Login unsuccessful"
          redirect_to :controller=>'home'
      end 
      end
  def logout
    session[:user] = nil
    #flash[:notice] = 'Logged out'
    redirect_to :controller => 'home', :action => 'index'
  end  
end
