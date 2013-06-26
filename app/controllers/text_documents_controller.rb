class TextDocumentsController < ApplicationController
  before_filter :set_project_id

  def set_project_id
    @project ||= Project.find(params[:project_id])
  end

  def show
    @text_document = TextDocument.find(params[:id])
  end

  def new
    @text_document = TextDocument.new
  end

  def create
    params[:text_document][:project_id] = params[:project_id]
    params[:text_document][:user_id] = current_user.id
    @text_document = TextDocument.new(params[:text_document])


    if @text_document.save!
      flash[:success] = "Document created"
      redirect_to_document
    else
      flash[:error] = "Problem creating document."
      render action: 'new'
    end
  end

  def edit
    @text_document = TextDocument.find(params[:id])
  end

  def update
    @text_document = TextDocument.find(params[:id])

    if @text_document.update_attributes(params[:text_document])
      flash[:success] = "Document updated"
      redirect_to_document
    else
      flash[:error] = "Problem updating document"
      render action: 'edit'
    end
  end

  def destroy
    @text_document = TextDocument.find(params[:id])
    flash[:success] = "Document destroyed"
    @text_document.destroy

    redirect_to_project
  end

  private
    def redirect_to_document
      redirect_to project_text_document_path(@text_document.project_id,
                                             @text_document)
    end

end
