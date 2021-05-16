class LineItemsController < ApplicationController
  before_action :set_order

  def create
    @line_item = @order.line_items.build(item_params)
    if @line_item.save
      session[:order_id] = @order.id 
    end

    respond_to do |format|
      format.js { render 'line_items/create' }
    end
  end

  def update
    @line_item = @order.line_items.find(params[:id])
    if @line_item.update(item_params)
      redirect_to cart_path
    end
  end

  def destroy
    @line_item =  @order.line_items.find(params[:id])
    @line_item.destroy
    redirect_to cart_path
  end

  private 

  def item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
