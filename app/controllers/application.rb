# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  before_filter :create_facebook_session
  before_filter :load_actions_to_publish
  helper_method :facebook_session
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'f24b769b0a1891878358b34d83dde283'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif facebook_session and @current_user.nil?
      user = User.find_by_facebook_id(facebook_session.user.id)
      if user
        session[:user_id] = user.id
        @current_user = user
      end
    end
  end
  
  helper_method :current_user
  
  def load_actions_to_publish
    @user_action_to_publish = flash[:user_action_to_publish] 
    flash[:user_action_to_publish]=nil
  end
  
  def login_required
    if current_user.nil?
      flash[:notice] = "You must login to access this page"
      session[:return_to] = request.request_uri
      redirect_to new_session_path and return
    end
  end
end
