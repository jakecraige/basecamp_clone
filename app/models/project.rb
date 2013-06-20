class Project < ActiveRecord::Base
  attr_accessible :description, :due, :status, :title, :user_id

  belongs_to :user
  has_many :discussions

  has_many :memberships, foreign_key: "project_id"
  has_many :members, through: :memberships, source: :user

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user_id
end
