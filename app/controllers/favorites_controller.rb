class FavoritesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    item = Item.find(params[:item_id])
    favorite = current_user.favorites.new(item_id: item.id)
    favorite.save

    @items=Item.all
    @item = item
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: item.id)
    favorite.destroy

    @items = Item.all
    @item = item
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
