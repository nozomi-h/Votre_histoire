class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
		user_path(resource)
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:tel_number,:password])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
	end
end
