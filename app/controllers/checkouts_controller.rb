class CheckoutsController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def show
  end
  
  def edit
  end

  def update
    if @order.update(address_params)
      redirect_to checkout_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:order).permit(:street, :city, :zip)
  end

  def set_order
    @order = current_order
  end

end
