class Task < ActiveRecord::Base
  attr_accessible :body, :complete, :due, :list_id, :user_id
end
