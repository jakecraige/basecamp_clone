class AddFileToTextDocuments < ActiveRecord::Migration
  def change
    add_column :text_documents, :file, :string
  end
end
