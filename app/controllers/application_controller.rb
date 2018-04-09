class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  before_action :set_locale

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_welcome_index_path
    else
      search_path
    end
  end

  def set_locale
    if cookies[:my_locale] && I18n.available_locales.include?(cookies[:my_locale].try(:to_sym))
      l = cookies[:my_locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:my_locale] = l
    end
    I18n.locale = l
  end
end
