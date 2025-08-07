class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!
  # def not_authenticated
  # redirect_to login_path, danger: t('defaults.flash_message.require_login')
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :hometown, :gender, :age]) # 必要に応じてカスタマイズ
    devise_parameter_sanitizer.permit(:sign_in, keys: []) # メールアドレスとパスワードだけに制限
  end
end
