class Membership < ActiveRecord::Base
  attr_accessible :member_id, :project_id

  belongs_to :user
  belongs_to :project

  validates_presence_of :member_id
  validates_presence_of :project_id
end
