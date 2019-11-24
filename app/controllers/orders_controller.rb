class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :create, :edit, :update, :complete]

  def index
    @user = current_user
    @orders = current_user.orders
    render :index
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    render :show
  end

  def create
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update

  end

  def complete
    @order = Order.find(params[:id])
  end
end
