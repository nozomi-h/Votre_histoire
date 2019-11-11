class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    ## userとcurrent-userが一致しないとtopに飛ぶ
    if @user.id != current_user.id
      redirect_to root_path
    end
    ## limit(1)で1件表示
    @orders = @user.orders.limit(1)
    @favorites = @user.favorite_items.limit(5)

  end

  def edit

  end

  def update

  end
end
