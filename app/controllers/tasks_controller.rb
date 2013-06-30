class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    @task.save
    redirect_to @list
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to list_path(@task.list_id)
    else
      render action: 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to root_path
  end

  def complete
     Task.update_all(["complete=?", 1], id: params[:task_ids])
     redirect_to List.find(params[:list_id])
  end
end
