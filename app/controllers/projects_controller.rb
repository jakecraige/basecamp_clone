class ProjectsController < ApplicationController
  #before_filter :verify_member
  before_filter :authenticate

  def index
    user_projects = current_user.projects
    member_of = current_user.member_of_project
    @projects = user_projects << member_of
  end

  def show
    @project = Project.find(params[:id])
    @title = @project.title
    @discussions = Discussion.where(project_id: params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.create(params[:project])
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_url
  end
  
  def toggle_status
    @project = Project.find(params[:id])
    @project.toggle!(:status)
    redirect_to @project
  end

  private
    def verify_member
      redirect_to root_path unless is_member?(current_user)
    end

    def is_member?(user)
      #@project = Project.find(params[:id])
      #@project.users.all.include?(user)
    end
end
