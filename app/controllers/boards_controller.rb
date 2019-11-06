class BoardsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  def index
    @boards = current_user.boards
    binding.pry
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
