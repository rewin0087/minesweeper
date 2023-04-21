class BoardsController < ApplicationController
  def index
    @boards = Board.page(params[:page])
  end

  def create
    @board = Board.new(board_params)

    if @board.valid?
      @board.save

      redirect_to board_path(@board), notice: 'Board was successfully generated'
    else
      @boards = Board.recent
      render 'home'
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def home
    @board = Board.new
    @boards = Board.recent
  end

  private

  def board_params
    params.require(:board).permit(:email, :name, :width, :height, :no_of_mines)
  end
end
