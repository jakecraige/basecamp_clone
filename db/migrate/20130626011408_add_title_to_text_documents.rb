class AddTitleToTextDocuments < ActiveRecord::Migration
  def change
    add_column :text_documents, :title, :string
  end
end
