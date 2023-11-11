module ApplicationHelper
  def current_page_class(controller_name, action_name)
    current_controller = params[:controller]
    current_action = params[:action]

    'w3-blue' if current_controller == controller_name && current_action == action_name
  end
end
