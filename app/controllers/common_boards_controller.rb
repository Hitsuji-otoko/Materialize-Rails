class CommonBoardsController < ApplicationController

    before_action :set_target_common_board, only: %i[show edit update destroy]

    def index 
        @common_boards = CommonBoard.all
    end

    def new
        @common_board = CommonBoard.new(flash[:common_board])
    end

    def create
        common_board = CommonBoard.new( 
            name: common_board_params[:name],
            title: common_board_params[:title],
            body: common_board_params[:body]
        )
        if common_board.save
            flash[:notice] = "「#{common_board.title}」の掲示板を作成しました!"
            redirect_to common_board
        else
            redirect_to new_common_board_path, flash: {
                board: common_board,
                error_messages: common_board.errors.full_messages
            }
        end 
    end

    def show
    end

    def edit
        @common_board = CommonBoard.find(params[:id])
    end

    def update
       @common_board.update(common_board_params)
        if @common_board.save
            flash[:notice] = "「#{@common_board.title}」の記事を編集しました"
            redirect_to common_board_path
        else
            redirect_to :back, flash: {
                board: @common_board,
                error_messages: @common_board.errors.full_messages
            }
        end
    end

    def destroy
        @common_board.destroy
        redirect_to ("/common_boards"), flash: { notice: "「#{@common_board.title}」の掲示板を削除しました。" }
    end

    private

    def common_board_params
        params.require(:common_board).permit(:name, :title, :body)
    end

    def set_target_common_board
        @common_board = CommonBoard.find(params[:id])
    end
end
