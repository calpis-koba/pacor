class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admins_orders_path
  end
  
  private
    def order_params
      params.require(:order).permit(:status)
    end
end
