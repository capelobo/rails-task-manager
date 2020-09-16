class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET http://localhost:3000/tasks
  def index
    @tasks = Task.all
  end

  # GET http://localhost:3000/tasks/1
  def show
    # @task = task.find(params[:id]) # before_action
  end

  # GET http://localhost:3000/tasks/1
  def new
    @task = Task.new
  end

  # POST http://localhost:3000/tasks
  def create
    # params[:task] => {"name"=>"teste", "address"=>"endereço", "rating"=>"10"}

    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)

  end

  # GET http://localhost:3000/tasks/3/edit
  def edit
    # @task = task.find(params[:id]) # before_action
  end

  # PATCH http://localhost:3000/tasks/3
  def update
    # @task = task.find(params[:id]) # before_action
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # DELETE http://localhost:3000/tasks/3
  def destroy
    # @task = task.find(params[:id]) # before_action
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
