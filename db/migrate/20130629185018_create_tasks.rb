class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body
      t.integer :list_id
      t.integer :user_id
      t.date :due
      t.boolean :complete

      t.timestamps
    end
  end
end
