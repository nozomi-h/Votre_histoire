class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    ## userとcurrent-userが一致しないとtopに飛ぶ
    if @user.id != current_user.id
      redirect_to root_path
    end
    @order = current_user.orders ## userを特定して注文日時を表示
    @orders = @user.orders.limit(3) ## limit(3)で1件表示
    #@favorites = @user.favorites.limit(10)
    @favorites = current_user.favorites
  end

  def create
    @user = User.new
    ## mail送付について
    if @user.save
      NotificationMailer.send_confirm_to_user(@user).deliver
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else
      redirect_to user_path(current_user.id)
    end
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

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :postal_code, :prefecture, :city_address, :building, :tel_number, :email)
  end
end
