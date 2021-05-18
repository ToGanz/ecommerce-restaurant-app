class OrdersController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :require_admin_user

  def index
    @orders = Order.where( { paid: true, delivered: false, canceled: false } )
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit()
    end

end
