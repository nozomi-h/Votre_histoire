class Admin::ItemsController < ApplicationController

  def index
    @genre = Genre.all

  end

  def show

  end

  def create
    item = Item.new(
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
    redirect_to admin_items_path
  end

  def new
    @item = Item.new
  end

  private
  def items_params
    params.require(:item).permit(:prodct_name,:image,:material,:price)
  end
  def genre_params
    ## viewから取得できる値がgenreのvalueのみであるため、idを取得するために検索
    ## データ構造上、genreは追加されることなくgenre_nameは常に一意であるためシステム上問題ない
    params.require(:item).permit(:genre_name)
  end
  def item_color_sizes_params
    params.require(:item).permit(:colors, :sizes)
  end
end
