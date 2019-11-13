class CartsController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy, :update]

  def new
    #if Cart.exists?(user_id: current_user.id)
    ## whereは該当するデータ全てが返ってくる
      @carts = Cart.where(user_id: current_user.id)
    #else
      #redirect_to root_path ## 空の場合のリダイレクト先
    #end
  end

  def index

  end

  def create

  end

  def update

  end

  def destroy

  end
end
