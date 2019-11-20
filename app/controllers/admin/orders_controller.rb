class Admin::OrdersController < ApplicationController
  PER = 9

  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show

  end
end
