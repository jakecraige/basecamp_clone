class List < ActiveRecord::Base
  attr_accessible :title, :project_id
  has_many :tasks, dependent: :destroy

end
