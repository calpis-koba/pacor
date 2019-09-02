class Admins::OrdersController < ApplicationController
      before_action:authenticate_admin!

  def index
    @orders = Order.page(params[:page]).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_orders_path
  end
  
  private
   def order_params
     params.require(:order).permit(:status)
   end
end
