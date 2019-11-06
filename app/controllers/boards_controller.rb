class BoardsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = current_user.boards
  end

  def new
    @board = current_user.boards.build
  end

  def edit
  end

  def create
    @board = current_user.board.build(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_board
    # @note = Note.find(params[:id])
    @board = current_user.boards.find_by(id: params[:id])
    redirect_to boards_url if @board.nil?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:name, :title, :body, :user_id)
  end

end
