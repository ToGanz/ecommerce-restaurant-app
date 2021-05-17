class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def checkout
    @order = current_order
  end

  def add_address
    @order = current_order
    @order.street =  address_params[:street]
    @order.city =  address_params[:city]
    @order.zip =  address_params[:zip]
    if @order.save
      # payment
    else
      render :checkout, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:order).permit(:street, :city, :zip)
  end
end
