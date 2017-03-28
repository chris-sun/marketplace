class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.create(order_params)
    # FIXME - should change this route later on
    redirect_to user_orders_path
  end

  def user_orders
    @orders = current_user.orders
  end

  def user_sales
    @services = current_user.services
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :price, :total_price,
                                  :service_id, :stripe_email, :currency, :stripe_customer_id)
  end  
end
