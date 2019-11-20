class Admin::UsersController < ApplicationController

  def index
    @user = User.page(params[:page]).per(10).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @addresses = Address.all
    @order = Order.page(params[:page])
  end
end
