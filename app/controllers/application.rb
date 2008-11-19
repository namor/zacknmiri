# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  HOST = "zacknmiri.com"
  helper :all # include all helpers, all the time
  
  before_filter :redirect_to_base

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery :secret => '4fe05a64a9e2be36064a35a42fda4f17', :only => :create
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  protected
  def redirect_to_base
    unless development_mode? || HOST==request.host
      redirect_to params.update(:host=>HOST)
      return false #stop filter chain
    end
  end
  
  def development_mode?
    RAILS_ENV != 'production'
  end
  
end
