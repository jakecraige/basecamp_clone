class AddFileToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :file, :string
  end
end
