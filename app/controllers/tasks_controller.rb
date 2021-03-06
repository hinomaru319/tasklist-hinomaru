class TasksController < ApplicationController
  
 before_action :require_user_logged_in
 before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @task = current_user.tasks.build
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]) 
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
     @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order(id: :desc).page(params[:page]) 
      flash.now[:danger] = 'Task が正常に投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task が正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が正常に更新されませんでした'
      render :edit
    end
  end

  def destroy
     @task.destroy
     flash[:success] = "タスクは削除されました"
     redirect_back(fallback_location: root_url)
  end
  
  private
  
   
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
  
  
  
  #Strong　Parameter　　　
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]) 
    unless @task
      redirect_to root_url
    end
  end
end
