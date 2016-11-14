class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may wantto use :null_session instead.

 before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:account_update) << :name
 end

   def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
  protect_from_forgery with: :exception
  #Render 404 if not found
  rescue_from ActionController::RoutingError, with: -> { render_404  }
  rescue_from ActionController::UnknownController, with: -> { render_404  }
  rescue_from ActiveRecord::RecordNotFound, with: -> { render_404  }
end
