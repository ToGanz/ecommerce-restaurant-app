class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:admin_section]
  before_action :require_admin_user, only: [:admin_section]
  
  def home
    @page = 'home'
  end

  def info
    @page = 'info'
  end

  def admin_section
  end

end
