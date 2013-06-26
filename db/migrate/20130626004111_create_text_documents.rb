class CreateTextDocuments < ActiveRecord::Migration
  def change
    create_table :text_documents do |t|
      t.text :body
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :text_documents, [:user_id, :project_id]
  end
end
