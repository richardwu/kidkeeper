class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :exception

 before_action :configure_permitted_parameters, if: :devise_controller?

 before_action :check_telemetry


 protected

 def configure_permitted_parameters
 	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:edison_token, :email, :password, :password_confirmation)}
 end

 def check_telemetry
 	if user_signed_in?
 		if current_user.telemetry.nil?
 			@telemetry = current_user.build_telemetry
 			@telemetry.save
 		end
 	end
 end
end
