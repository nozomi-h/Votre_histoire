class Admin::OrdersController < ApplicationController
  PER = 9

  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
end
