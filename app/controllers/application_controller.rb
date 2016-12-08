class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :fix_url

  def fix_url(str)
    #needs Regex
    (str.starts_with?('http://') || str.starts_with?('https://')) ? str : "http://#{str}"
  end
  
  def require_admin
    access_denied unless user_signed_in? and current_user.admin?
  end
  
  def require_moderator
    access_denied unless user_signed_in? and (current_user.admin? || current_user.moderator?)
  end
  
  def access_denied
    flash[:error] = "You can't do that."
    redirect_to root_path
  end
end
