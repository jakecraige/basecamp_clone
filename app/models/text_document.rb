class TextDocument < ActiveRecord::Base
  attr_accessible :body, :project_id, :user_id, :title, :file
  mount_uploader :file, FileUploader
  belongs_to :user
  belongs_to :project

  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :project_id
  validates_presence_of :user_id

  default_scope order("created_at DESC")

  def is_owner?(user)
    user_id == user.id
  end
end
