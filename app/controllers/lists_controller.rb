class ListsController < ApplicationController
  def index
    @lists = List.where(project_id: params[:project_id])
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
    @project = Project.find(@list.project_id)
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    params[:list][:project_id] = session[:project_id]
    @list = List.new(params[:list])
    if @list.save
      redirect_to @list
    else
      render action: 'new'
    end
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to @list
    else
      render action: 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end
end
