# TASKS = [
#   'read POODR',
#   'grocery shopping',
#   'do laundry'
# ]

class TasksController < ApplicationController

  def index
    # @tasks = TASKS
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completion_date: params[:task][:completion]
    )

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end
end
