class ProjectsController < ApplicationController
  before_filter :authenticate

  def index
    user_projects      = current_user.projects
    member_of          = current_user.member_of_project

    @active_projects   = user_projects.active + member_of.active
    @archived_projects = user_projects.archived + member_of.archived

    @title = "My Projects"
  end

  def show
    @project = Project.find(params[:id])
    @title = @project.title
    session[:project_id] = @project.id

    @members        = @project.members
    @discussions    = @project.discussions
    @lists          = @project.lists
    @text_documents = @project.text_documents

    objects_for_feed_display = [@discussions, @text_documents,
                                @lists, @members]
    @feeds = ActivityFeed::feed(objects_for_feed_display)
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
    project = Project.find(params[:project_id])
    project.toggle!(:status)
    redirect_to project
  end

  def members_page
    @project = Project.find(params[:project_id])
  end

  def add_member
    project = Project.find(params[:project_id])
    user    = User.find_by_email(params[:user_email])
    errors  = []

    if user && !user.nil?
      if params[:user_email] != project.user.email 
        if !project.members.include?(user)
          project.members << user
          redirect_to project, flash: { success: "Member Added." }
        else
          errors << ["Entered email is already a member."]
        end
      else
        errors << ["Entered email is owner of project."]
      end
    else
      errors = ["Could not find entered email."]
    end
    if errors.any?
      redirect_to project_members_path(params[:project_id]),
                    flash: { error: errors.join("<br>") }
    end
  end

  def remove_member
    @member = Membership.where(project_id: params[:project_id],
                              user_id: params[:id]).first
    if @member
      flash[:success] = "Member removed."
      @member.destroy
    else
      flash[:error] = "Error removing member."
    end
    redirect_to project_path(params[:project_id])
    
  end
end
