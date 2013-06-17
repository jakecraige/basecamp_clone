class Project < ActiveRecord::Base
  attr_accessible :description, :due, :owner, :status, :title
  belongs_to :user
  has_many :discussions
  validates :title, presence: true

  def owner?(user_id)
    self.owner == user_id
  end
end
