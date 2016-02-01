module ApplicationHelper
  def auth_token
  <<-HTML.html_safe
    <input type="hidden"
     name="authenticity_token"
     value="#{form_authenticity_token}">
    HTML
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def is_logged_in
    !!current_user
  end
end
