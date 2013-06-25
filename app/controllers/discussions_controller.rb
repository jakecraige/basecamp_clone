class DiscussionsController < ApplicationController
  def index
    redirect_to project_path(params[:project_id])
  end

  def show
    @discussion = Discussion.find(params[:id])
    @project = Project.find(params[:project_id])
    @comment = Comment.new
    @comments = Comment.where(discussion_id: params[:id])
  end

  def new
    @discussion = Discussion.new
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def create
    cur_project = Project.find(params[:project_id])
    @discussion = cur_project.discussions.new(params[:discussion])
    @discussion.user_id = current_user.id

      if @discussion.save
        redirect_to project_discussion_path(@discussion.project_id, @discussion),
          notice: 'Discussion was successfully created.'
      else
        render action: "new"
      end
  end

  def update
    @discussion = Discussion.find(params[:id])

    if @discussion.update_attributes(params[:discussion])
      redirect_to project_discussion_path(@discussion.project_id, @discussion), notice: 'Discussion was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    redirect_to project_path(params[:project_id])
  end
end
