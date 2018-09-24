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
    )

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
    )
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    @task.destroy
    redirect_to tasks_path
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])

    @task.completion_date = Time.now
    @task.save
    redirect_to tasks_path
  end

  def unmark_complete
    @task = Task.find_by(id: params[:id])

    @task.completion_date = nil
    @task.save
    redirect_to tasks_path
  end
end
