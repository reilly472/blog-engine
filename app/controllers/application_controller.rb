class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :fix_url

  def fix_url(str)
    #needs Regex
    (str.starts_with?('http://') || str.starts_with?('https://')) ? str : "http://#{str}"
  end
end
