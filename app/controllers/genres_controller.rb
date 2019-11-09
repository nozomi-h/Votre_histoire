class GenresController < ApplicationController

  def show
    ## 特定のジャンルで検索し複数件取得できた物を表示 page~..(20)=20件ごとにページ化 .reverse_order=降順 ※ここでいう.orderはソートで並べ替えるという意味 何も書かないとidの昇順になる
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(20).reverse_order

  end
end
