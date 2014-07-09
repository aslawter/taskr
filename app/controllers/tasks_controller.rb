class TasksController < ApplicationController
  before_action :require_login
  def index
    @task = Task.new
    @tasks = current_user.tasks.not_completed.order("created_at DESC")
  end

  def create
    @task = current_user.tasks.new(task_params)
    @tasks = current_user.tasks

    if @task.save
        render @task
    else
      render partial: "errors",
        locals: { target: @task },
        status: 422
    end
  end

  def update
    task = current_user.tasks.find(params[:id])

    if task.update(task_params)
      render nothing: true 
    end
  end

  private

  def task_params
   params.require(:task).permit(
     :title,
     :body,
     :completed,
   )
  end
end
