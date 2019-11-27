class Admin::ItemsController < ApplicationController

  PER = 9 ## ページネーション

  def index
    @item = Item.all
    @items = Item.all
    @genre = Genre.all
    @items = Item.page(params[:page]).per(10).reverse_order
  end

  def show

  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end

  def new
    @item = Item.new
    # @item.item_colors.build
    item_color = @item.item_colors.build ## @~~ = 親モデル.子モデル.buildとやらないと、新規作成時にはidが入れられないことに注意
    item_color.item_color_sizes.build
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params) # その他の情報を更新する
    redirect_to admin_items_path(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:prodct_name, :image, :material, :price, :genre, :status, :amount,
      item_colors_attributes: [:color_id, :item_id, :id, :_destroy,
        item_color_sizes_attributes: [:item_color_id, :size_id, :id, :_destroy]])
  end
end
