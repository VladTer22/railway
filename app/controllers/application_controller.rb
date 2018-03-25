class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_welcome_index_path
    else
      search_path
    end
  end
end
