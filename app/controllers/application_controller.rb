class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!

  private
  #def not_authenticated
    #redirect_to login_path, danger: t('defaults.flash_message.require_login')
  #end
end
