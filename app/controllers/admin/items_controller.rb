class Admin::ItemsController < ApplicationController

  def index

  end

  def show

  end

  def create
    item=Item.new(
      prodct_name:params[:prodct_name], ## paramsからprodct_nameを取得
      material:params[:material], ## paramsからmaterialを取得
      price:params[:price], ## paramsからpricrを取得
      status:1, ## 販売停止中
      genre_id:Genre.where(genre_name:params[:genre_name]).first.id ## genre tableからparamsのgenre_nameを使用して検索し、取得データの先頭のidを抽出する
    )

    item_color_size = ItemColorSize.new(
      item_id:item.id,
      color_id:Color.where(color:params[:colors]). ## color tableからparamsのcolorsを使用して検索し、取得データの先頭のidを抽出する
      first.id,size_id:Size.where(size:params[:sizes]).first.id ## size tableからparamsのsizesを使用して検索し、取得データの先頭のidを抽出する
    )
    item.save
    item_color_size.save
  end


  def new

  end
end
