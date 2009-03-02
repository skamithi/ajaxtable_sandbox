# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '85efbd8702a971f1d502db6d1054e2b5'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password


  # In each controller define a add_spinner.js.rjs with the specific controller view
  # to control where spinners are added. return 404 if its not a AJAX request.
  # You can use this as a template for any AJAX only actions.
  def add_spinners
    respond_to do |format|
        format.html do
          render :file => "#{RAILS_ROOT}/public/404.html",
              :status => 404
        end
        format.js
    end
  end

end
