class ApplicationController < ActionController::Base

  private

  def require_admin_user
    if !current_user.admin? 
      redirect_to(root_url)
    end
  end
end
