class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.boolean :status, default: true
      t.date :due
      t.integer :user_id

      t.timestamps
    end
  end
end
