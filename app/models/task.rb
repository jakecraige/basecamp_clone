class Task < ActiveRecord::Base
  attr_accessible :body, :complete, :due, :list_id, :user_id
  belongs_to :user
  belongs_to :list

  scope :completed,     where(complete: 1)
  scope :not_completed, where("complete IS NOT 1")
end
