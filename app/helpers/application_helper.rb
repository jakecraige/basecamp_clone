module ApplicationHelper
  def get_name(id)
    User.find(id).name
  end
  def link_name(id, options = {})
    if options.has_key?(:class)
      link_to get_name(id), user_path(id), class: options[:class]
    else
      link_to get_name(id), user_path(id)
    end
  end
end
