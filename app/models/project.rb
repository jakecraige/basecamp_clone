class Project < ActiveRecord::Base
  attr_accessible :description, :due, :status, :title, :user_id
  has_and_belongs_to_many :users
end
