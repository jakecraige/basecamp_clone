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
    redirect_to @list
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to lists_path(@task.list_id)
    else
      render action: 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to root_path
  end
end
