class MenuController < ApplicationController
  before_action :set_categories
  
  def index
    @page = 'menu'
    @products = Product.all
  end

  private

  def set_categories
    @categories = Category.all.where(display: true)
  end
end
