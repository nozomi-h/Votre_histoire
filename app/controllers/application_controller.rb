class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  ## 新規登録した時のリダイレクト先
  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  ## ログインした時のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when :admin
      new_admin_item_path
    when :user
      user_path(resource)
    end
	end

  ## ログアウトした時のリダイレクト先
  def after_sign_out_path_for(resource)
    case resource
    when :admin ## adminの場合
      new_admin_session_path ## adminのログインページへ
    when :user ## userの場合
      root_path ## トップページへ
    end
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:tel_number,:postal_code,:prefecture,:city_address,:building,:password,:birth_day,:sex])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
	end
end
