class MenuController < ApplicationController
  before_action :set_categories

  def index
    @page = 'menu'
    @products = Product.all
    @line_item = current_order.line_items.new
  end

  def search
    query = params[:search]
    filter = params[:filter]
    results = Product.where('lower(name) LIKE ?', "%#{query.downcase}%")
    if filter != "" 
      # 'Dairy Free' -> 'Dairy_Free' -> 'dairy_free' -> :dairy_free
      symbol = filter.gsub(/ /, '_').downcase.to_sym
      @products = results.where(symbol => true)
    else
      @products = results
    end
  end

  private

  def set_categories
    @categories = Category.all.where(display: true)
  end
end
