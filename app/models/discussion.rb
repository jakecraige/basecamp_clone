class Discussion < ActiveRecord::Base
  attr_accessible :message, :project_id, :title, :user_id
  belongs_to :project
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :message
  validates_presence_of :project_id
  validates_presence_of :user_id

  default_scope order("created_at DESC")

  def is_owner?(user)
    user_id == user.id
  end
end
