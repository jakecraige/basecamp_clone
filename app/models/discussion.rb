class Discussion < ActiveRecord::Base
  attr_accessible :message, :project_id, :title, :user_id
  belongs_to :project
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :message
end