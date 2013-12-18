##
# Class for controlling all the boards

class BoardsController < ApplicationController
  require 'json'
  respond_to :json

  ##
  # Lists all the boards belonging the the user (which is found by looking up the parameter id)
  def index
    redirect_to User.find(params[:user_id])
  end

  ##
  # Updates the contents of board.content by receiving ajax POST requests from board/show
  def update
    @user = User.find(params[:user_id])
    @board = @user.boards.find(params[:id])
    @board.update_column(:content, params[:board].as_json)
    respond_to do |format|
      format.json { render json: @board }
    end
  end

  ##
  # Creates a board with a provided title for the board, if it is saved correctly, "Board created!"
  # is flashed, otherwise (if the title length is above 40), the error gets flashed
  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = "Board created!"
      redirect_to [@current_user, @board]
    else
      error = ''
      @board.errors.full_messages.each do |m|
        error += m
      end
      flash[:danger] = error
      redirect_to @current_user
    end
  end

  ##
  # Displays the main canvas page where the board is to be editted, if the current logged in user
  # isn't the owner of the board that is trying to be accessed, the current user gets redirected to
  # the user's (who's board was to be accessed) show page
  def show
    @user = User.find(params[:user_id])
    if current_user?(@user)
      @board = @user.boards.find(params[:id])
      @content = @board.content
      if @content
        @content = @board.content.gsub('\\', '').gsub(/.$/, '').gsub(/^./, '')
      end
    else
      flash[:danger] = 'Access denied'
      redirect_to @user
    end
  end

  private

    def board_params
      params.require(:board).permit(:title)
    end

end
