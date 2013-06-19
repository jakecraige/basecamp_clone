class Project < ActiveRecord::Base
  attr_accessible :description, :due, :status, :title, :user_id

  belongs_to :user
  has_many :discussions

  has_many :members, class_name: "Membership"

  validates_presence_of :title
  validates_presence_of :description
end
