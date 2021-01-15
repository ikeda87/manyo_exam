class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def index
  end

  def create

  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice:"タスクを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path,notice:"タスクを削除しました"
  end

  private
  def task_params
    params.require(:task).permit(:title,:status,:content,:deadline,:priority, { label_ids: []} )
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
