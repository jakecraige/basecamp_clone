class Project < ActiveRecord::Base
  attr_accessible :description, :due, :status, :title, :user_id

  belongs_to :user
  has_many :discussions
  has_many :text_documents

  has_many :memberships, foreign_key: "project_id"
  has_many :members, through: :memberships, source: :user

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user_id

  default_scope order("due ASC")

  def is_owner?(user)
    user_id == user.id
  end

  def archived?
    !status
  end

  def active?
    status
  end
end
