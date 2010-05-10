# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def parse_time_param(obj,name)
    Time.parse("#{params[obj]["#{name}(4i)"]}:#{params[obj]["#{name}(5i)"]}")
  end
end
