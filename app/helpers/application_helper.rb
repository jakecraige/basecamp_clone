module ApplicationHelper
  def get_name(id)
    User.find(id).name
  end
  def link_name(id)
    link_to get_name(id), user_path(id)
  end
end
