class ApplicationController < ActionController::Base

  ## 新規登録した時のリダイレクト先
  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  ## ログインした時のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when :admin
      admin_path
    when :user
    user_path(resource)
    end
	end

  ## ログアウトした時のリダイレクト先
  def after_sign_out_path_for(resource)
    case resource
    when :admin ## adminの場合
      new_admin_sesstion_path ## adminのログインページへ
    when :user ## userの場合
      root_path ## トップページへ
    end
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_kana_name,:first_kana_name,:email,:tel_number,:password])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
	end
end
