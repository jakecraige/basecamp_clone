class Discussion < ActiveRecord::Base
  attr_accessible :message, :project_id, :title, :user_id, :file
  mount_uploader :file, FileUploader
  belongs_to :project
  belongs_to :user

  has_many :comments

  validates_presence_of :title
  validates_presence_of :message
  validates_presence_of :project_id
  validates_presence_of :user_id

  default_scope order("created_at DESC")

end
