class LineItemsController < ApplicationController
  before_action :set_order

  def create
    @line_item = @order.line_items.build(order_params)
    if @line_item.save
      session[:order_id] = @order.id
    else
      
    end
  end

  private 

  def order_params
    params.require(:line_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
