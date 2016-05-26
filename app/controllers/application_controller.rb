class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :student_id, :email, :password, :password_confirmation) }
	end

	def admin_user
        if current_user == nil or current_user.admin == false
			redirect_to posts_path
			return
		end
	end
end
