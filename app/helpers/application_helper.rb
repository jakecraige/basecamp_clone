module ApplicationHelper
  def get_name(id)
    User.find(id).name
  end
end
