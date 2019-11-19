class Admin::ItemsController < ApplicationController

  def index
    @item = Item.all
    @items = Item.all
    @genre = Genre.all

  end

  def show

  end

  def create
    item = Item.new(
      prodct_name:items_params[:prodct_name], ## paramsからprodct_nameを取得
      material:items_params[:material], ## paramsからmaterialを取得
      price:items_params[:price], ## paramsからpricrを取得
      status:1, ## 販売停止中
      genre:genre_params[:genre_name].to_i ## item tableからparamsのgenre_nameを使用して検索し、取得データの先頭のidを抽出する
    )
    item.save
    item_color_size = ItemColorSize.new(
      item_id:item.id,
      color_id:Color.where(color:item_color_sizes_params[:colors]).first.id,## color tableからparamsのcolorsを使用して検索し、取得データの先頭のidを抽出する
      size_id:Size.where(size:item_color_sizes_params[:sizes]).first.id ## size tableからparamsのsizesを使用して検索し、取得データの先頭のidを抽出する
    )
    item_color_size.save
    redirect_to admin_items_path
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    p Color.colors[params[:colors]]
    p Size.sizes[params[:sizes]]

    item_color_size = @item.item_color_sizes.build # まず、colorもsizeもセットされていない（itemだけがセットされている）新しい item_color_size を作る
    item_color_size.color = Color.find_by_color(Color.colors.key(items_params[:colors].to_i)) # paramsの:colorsで渡された "0" や "1" という文字列を to_i メソッドで数字に変換し、それを使ってDBから取得した Color インスタンスを item_color_size の color アトリビュートにセットする
    item_color_size.size = Size.find_by_size(Size.sizes.key(items_params[:sizes].to_i)) # ↑のsize版
    @item.item_color_sizes << item_color_size # item/color/sizeが揃ったいい感じの item_color_size が完成したので、含める
    @item.update(items_params) # その他の情報を更新する

    #@item.item_color_sizes << @item.item_color_sizes.create(color: Color.find(items_params[:colors]) , size:Size.find(items_params[:sizes]))
    #@item.update(items_params)
    redirect_to  admin_items_path(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private
  def items_params
    params.require(:item).permit(:prodct_name,:image,:material,:price,:colors,:sizes)
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
