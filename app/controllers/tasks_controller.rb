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
    @task = TASKS[task_id]
    if @task.nil?
      head :not_found
    end
  end
end
