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
    @carts = Cart.where(user_id: current_user.id)
    @order = Order.new
    @order.user = current_user
    @order.address = @order.user.addresses.first
    # @order.address = @order.user.carts.first.address
    @order.payment = 0
    @order.status = 0
    sum = 0
    @carts.each do |cart|
    sum += cart.item.price
    end
    @order.purchase_price = sum
    if @order.save
      current_user.carts.destroy_all ## has manyした物を全部消す
      redirect_to complete_order_path(@order.id)
    else
      user_cart_path(current_user)
    end
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
