class TasksController < ApplicationController
  before_action :set_task,only:[ :show, :edit, :update, :destroy ]

  def new
    @task = Task.new
  end

  def index
  @tasks = Task.all.order(created_at: "desc")
   if params[:task].present?
     if params[:task][:title].present? && params[:task][:status].present?
      @tasks = current_user.tasks.search_title(params[:task][:title]).search_status(params[:task][:status]).pagination(params)
     elsif params[:task][:title].present?
      @tasks = current_user.tasks.search_title(params[:task][:title]).pagination(params)
     elsif params[:task][:status].present?
      @tasks = current_user.tasks.search_status(params[:task][:status]).pagination(params)
     end
   # elsif
   #   if params[:sort_expired].present?
   #     @tasks = current_user.tasks.sort_deadline.pagination(params)
   #   elsif params[:sort_priority].present?
   #     @tasks = current_user.tasks.sort_priority.pagination(params)
   #   end
   end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: '詳細が表示されます'
    else
      render :new
    end
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
    params.require(:task).permit(:title,:content,:status,:deadline,:priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
