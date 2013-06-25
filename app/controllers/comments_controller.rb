class CommentsController < ApplicationController
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @discussion = Discussion.find(@comment.discussion_id)
  end

  def create
    @comment = Comment.new(params[:comment])
    @discussion = Discussion.find(@comment.discussion_id)
      if @comment.save
        redirect_to project_discussion_path(@discussion.project_id, @discussion), notice: 'Comment was successfully created.'
      else
        render action: "new"
      end
  end

  def update
    @comment = Comment.find(params[:id])
    @discussion = Discussion.find(@comment.discussion_id)

    if @comment.update_attributes(params[:comment])
        redirect_to project_discussion_path(@discussion.project_id, @discussion), notice: 'Comment was successfully created.'
    else
      render action: "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
