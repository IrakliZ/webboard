class BoardsController < ApplicationController
  require 'json'
  respond_to :json

  def index

  end

  def update
    @user = User.find(params[:user_id])
    @board = @user.boards.find(params[:id])
    puts '@@@@@@@@@@@@@@@@@@@@@@@@@@'
    puts params[:board]
    @board.update_column(:content, params[:board])
    respond_to do |format|
      format.json { render json: @board }
    end
  end

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

  def show
    @test = ''
    @user = User.find(params[:user_id])
    if current_user?(@user)
      @board = @user.boards.find(params[:id])
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
