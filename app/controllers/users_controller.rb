class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    ## userとcurrent-userが一致しないとtopに飛ぶ
    if @user.id != current_user.id
      redirect_to root_path
    end
    ## limit(1)で1件表示
    @orders = @user.orders.limit(1)
    @favorites = @user.favorites.limit(5)
    # @order = @user.order
  end

  def create
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
end
