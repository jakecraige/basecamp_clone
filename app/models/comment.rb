class Comment < ActiveRecord::Base
  attr_accessible :body, :project_id, :user_id

  belongs_to :user
  belongs_to :discussion

  validates_presence_of :body
  validates_presence_of :project_id
  validates_presence_of :user_id
end
