TASKS = [
  'read POODR',
  'grocery shopping',
  'do laundry'
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
