class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    ## userとcurrent-userが一致しないとtopに飛ぶ
    if @user.id != current_user.id
      redirect_to root_path
    end
    @orders = @user.orders.last ## lastで最後に注文したorderを表示
    @favorites = @user.favorites.limit(5) ## limitで表示件数を指定
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
