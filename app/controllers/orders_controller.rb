class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :create, :edit, :update, :complete]

  def index
    ## @user =
    @orders = current_user.orders
  end

  def show
    ## @user =
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def create

  end

  def edit
    @order = Order.find(params[:id])
  end

  def update

  end

  def complete

  end
end
