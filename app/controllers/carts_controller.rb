class CartsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy, :update]

  def new
    @carts = Cart.where(user_id: current_user.id)
    if @cart_items.empty? ## cartは空か？
      redirect_to root_path ## cartが空ならtopページへ
    end
    #if Cart.exists?(user_id: current_user.id)
    ## whereは該当するデータ全てが返ってくる
      @carts = Cart.where(user_id: current_user.id)
    #else
      #redirect_to root_path ## 空の場合のリダイレクト先
    #end
    @user = current_user
    @addresses = @user.addresses
  end

  def index
  end

  def create
    user_cart = current_user.carts.where(item_id: params[:cart][:item_id].to_i).first
    if user_cart
      @cart = user_cart
      amount = params[:cart][:amount].to_i + @cart.amount
      @cart.update(amount: amount)
      redirect_to user_cart_items_path(current_user.id)
    else
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.amount = params[:cart][:amount].to_i
      @cart.item_id = params[:cart][:item_id].to_i
      if @cart.save
        redirect_to user_carts_path(current_user.id)
      else
        @items = Item.page(params[:page]).per(10).reverse_order
        render 'items/index'
      end
    end
  end

  def update
  end

  def destroy
    @item = Cart.find(params[:id])
    @item.destroy
    redirect_to user_cart_path(current_user.id)
  end
end
