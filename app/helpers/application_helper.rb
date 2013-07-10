module ApplicationHelper
  def link_name(user, options = {})
    if options.has_key?(:class)
      link_to user.name, user, class: options[:class]
    else
      link_to user.name, user
    end
  end
end
