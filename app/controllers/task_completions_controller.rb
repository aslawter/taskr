class TaskCompletionsController < ApplicationController
  def create 
    task = current_user.tasks.find(params[:task_id])
    task.update_attribute(:completed, true)

    redirect_to :tasks
  end
end
