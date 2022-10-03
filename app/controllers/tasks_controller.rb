class TasksController < ApplicationController
  before_action :get_user
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = @user.tasks.new
  end

  def edit
  end

  def create
    @task = @user.tasks.new(task_params)

    if @task.save
      redirect_to user_path(@user)
    else
      redirect_to new_user_task_path(@user), danger: "Name field is required"
    end
  end

  def update
    if @task.update(task_params)
     redirect_to user_path(@user)
    else
      redirect_to edit_user_task_path(@user, @task), danger: "Name field is required"
    end
  end

  def destroy
    @user.tasks.destroy(@task)
    redirect_to user_path(@user)
  end

  private

    def get_user
      @user = User.find(params[:user_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :status)
    end
end
