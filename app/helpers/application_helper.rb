module ApplicationHelper
  def link_name(user, options = {})
    if options.has_key?(:class)
      link_to user.email, user, class: options[:class]
    else
      link_to user.email, user
    end
  end
end
