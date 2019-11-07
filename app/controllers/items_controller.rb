class ItemsController < ApplicationController



  def index
    ## ViewのFormで取得したパラメータをモデルに渡す
    @items = Item.search(params[:search])
    ## order_item tableから1週間前から当日までのデータを取ってきてitem_id単位に数量の合計値を取得し、合計数の高い順から高順に並べそのitem_idを取得する。取得されたitem_idを元にitem tableからデータを取得する。
    ## limit(20)は最大saidai20件表示するという意味　## ..の間の物を取ってくる　データの作成日時から1週間前と当日の間のデータを取ってくる　## groupはitem_id単位 集計をする場合に用いられる 今回はsum(合計値) ##orderはソート機能 desc=降順 pluck=特定のカラムを取り出す
    @weekly_ranks = Item.find(OrderItem.where(created_at: 1.weeks.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(amount) desc').limit(20).pluck(:item_id))
  end

  def show

  end

end
