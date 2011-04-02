# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  include ExceptionNotification::Notifiable

  # Scrub sensitive parameters from your log
   filter_parameter_logging :password
   
  # require 'Utilities'
  def validate_user
      if current_user.blank?
          redirect_to login_url and return false
      end
  end
  def validate_admin
      if current_user.blank? or (!current_user.blank? && current_user.is_admin)
        return true 
      else
          render :file => "#{RAILS_ROOT}/public/422.html",:status=>422
      end
  end
end
