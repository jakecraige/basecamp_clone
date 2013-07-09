class Comment < ActiveRecord::Base
  attr_accessible :body, :project_id, :user_id, :discussion_id

  belongs_to :user
  belongs_to :discussion

  validates_presence_of :body
  validates_presence_of :user_id
  validates_presence_of :discussion_id

  default_scope order("created_at DESC")

  def is_owner?(this_user)
    user == this_user
  end
end
