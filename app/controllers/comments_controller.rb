class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @discussion = @comment.discussion
  end

  def create
    @comment    = Comment.new(params[:comment])
    @discussion = @comment.discussion
      if @comment.save!
        redirect_to project_discussion_path(@discussion.project, @discussion), notice: 'Comment was successfully created.'
      else
        render action: "new"
      end

      return "wahtever"
  end

  def update
    @comment = Comment.find(params[:id])
    @discussion = @comment.discussion

    if @comment.update_attributes(params[:comment])
        redirect_to project_discussion_path(@discussion.project, @discussion), notice: 'Comment was successfully updated.'
    else
      render action: "edit"
    end
  end
end
