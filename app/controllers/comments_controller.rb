class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :creat]
  before_action :set_task, only: [:new, :create]
  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = @task.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to board_task_path(board_id: @task.board_id, id: @task), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
      end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end