class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :create, :edit, :update, :complete]


  def index
    @user = current_user
    @orders = @user.orders
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
    if @order.user.addresses.any?
      @order.address = @order.user.addresses.first
    else
      @order.address = @order.user.addresses.build({
        first_name: @order.user.first_name,
        last_name: @order.user.last_name,
        first_kana_name: @order.user.first_kana_name,
        last_kana_name: @order.user.last_kana_name,
        tel_number: @order.user.tel_number,
        postal_code: @order.user.postal_code,
        prefecture: @order.user.prefecture,
        city_address: @order.user.city_address,
        building: @order.user.building,
      })
    end
    @order.payment = 0
    @order.status = 0
    sum = 0
    @carts.each do |cart|
    sum += cart.item.price
    end
    @order.purchase_price = sum
    if @order.save
      @order.update(order_number: @order.order_number)
      @carts.each do |cart|
        @order_item = OrderItem.new
        @order_item.item_id = cart.item.id
        @order_item.amount = cart.amount
        @order_item.order_id = @order.id
        @order_item.total_price = cart.item.price
        @order_item.save
      end
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
