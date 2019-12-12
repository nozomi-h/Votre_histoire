class CartsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy, :update]

  def new
    if Cart.exists?(user_id: current_user.id)
      @carts = Cart.where(user_id: current_user.id) ## whereで該当するデータ全てが返ってくる
    else
      redirect_to root_path ## 空の場合のリダイレクト先
    end
    @user = current_user
    @addresses = @user.addresses
  end

  def index
    @carts = Cart.where(user_id: current_user.id) ## whereで該当する商品全て持ってくる
    @user = current_user
    @addresses = @user.addresses
  end

  def create
    #@cart = current_user.carts.build(cart_params)
    #user_cart = current_user.carts.where(item_id: params[:cart][:item_id].to_i).first
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.amount = 1
      @cart.item_id = params[:item_id].to_i
      @cart.item_color_id = params[:item_color_id]
      @cart.item_color_size_id = params[:item_color_size_id]
      if @cart.save
        redirect_to new_user_cart_path(current_user.id)
      else
        @items = Item.page(params[:page]).per(10).reverse_order
        render 'items/index'
      end
  end

  def update
    @carts = Cart.where(user_id: current_user.id)
    @carts.each_with_index do |cart, i|
      if cart.update(amount: params[:amount][i.to_s])
      else
        @items = Item.page(params[:page]).per(10).reverse_order
        render 'items/index'
      end
    end
    redirect_to new_order_path
  end

  def destroy
    @item = Cart.find(params[:id])
    @item.destroy
    redirect_to new_user_cart_path(current_user.id)
  end

  private
  def split_address(address)
    array = address.split
    { delivery_last_name: array[0], delivery_first_name: array[1], delivery_last_kana_name: array[2], delivery_first_kana_name: array[3], postal_code: array[4], prefecture: array[5], city_address: array[6], building: array[7]}
    # splitメソッドで区切って配列にする、デフォでスペースで区切ってくれるので今回引数はなし
  end

  def cart_params
    case params[:address].to_i
    when 0
      address_data = { delivery_last_name: current_user.last_name, delivery_first_name: current_user.first_name, postal_code: current_user.postal_code, prefecture: current_user.prefecture, city_address: current_user.city_address, building: current_user.building}
      payment_data = {delivery_first_kana_name: current_user.first_kana_name, delivery_last_kana_name: current_user.last_kana_name, payment: params[:payment].to_i, purchase_price: 600, status: 0}
    when 1
      address = params[:other_address]
      address_data = split_address(address)
      payment_data = { payment: params[:payment].to_i, purchase_price: current_user.cart_sum, postage: 600, status: 0}
    end
    address_data.merge(payment_data)
  end

  def order_update_params
    params.require(:order).permit(:delivery_last_name, :delivery_first_name, :delivery_last_kana_name, :delivery_first_kana_name, :postal_code, :city_address, :prefecture, :building)
  end
end
