class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :owner
      t.string :title
      t.text :description
      t.boolean :status
      t.date :due

      t.timestamps
    end
  end
end
