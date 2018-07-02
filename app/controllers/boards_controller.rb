class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /users/1/boards
  def index
    @boards = current_user.boards
  end

  # GET /users/1/boards/1
  def show
    @saved_pictures = @board.saved_pictures.order(created_at: :desc)
  end

  # GET users/1/boards/new
  def new
    @board = Board.new
  end

  # GET users/1/boards/1/edit
  def edit
  end

  # POST users/1/boards
  def create
    @board = Board.new(board_params)
    
    if @board.save
      redirect_to user_boards_path(current_user)
    else
      flash.now[:danger] = 'Qualcosa è andato storto!'
      render 'new'
    end
  end

  # PATCH/PUT /users/1/boards/1
  def update
    if @board.update(board_params)
      redirect_to user_boards_path(current_user)
    else
      flash.now[:danger] = 'Bacheca non aggiornata'
      render 'edit'
    end
  end

  # DELETE /users/1/boards/1
  def destroy
    @board.saved_pictures.each do |sp|
      sp.destroy
    end
    @board.destroy

    redirect_to user_boards_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :user_id)
    end
end
