module ApplicationHelper
  def current_order
    # Use find by id avoid potential errors
    # Order.find sometimes doesnt work with .nil?
    if Order.find_by_id(session[:order_id]).nil?
      Order.new
    else
      Order.find_by_id(session[:order_id])
    end
    # @current_order ||= Order.find_by_id(session[:order_id]) || Order.new
  end
end
