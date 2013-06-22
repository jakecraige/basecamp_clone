class DiscussionsController < ApplicationController
  def index
    redirect_to project_path(params[:project_id])
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
    @discussion = Discussion.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    cur_project = Project.find(params[:project_id])
    @discussion = cur_project.discussions.new(params[:discussion])
    @discussion.user_id = current_user.id

      if @discussion.save
        redirect_to project_discussion_path(@discussion),
          notice: 'Discussion was successfully created.'
      else
        render action: "new"
      end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = Discussion.find(params[:id])

    if @discussion.update_attributes(params[:discussion])
      redirect_to project_discussion_path(@discussion), notice: 'Discussion was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy

    redirect_to project_path(params[:project_id])
  end
end
