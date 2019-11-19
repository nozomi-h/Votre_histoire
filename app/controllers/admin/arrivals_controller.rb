class Admin::ArrivalsController < ApplicationController

  def new
    @item = Item.new
    # @arrival = Arrival.find(params[:item_id])
  end

  def index
    @arrivals = Arrival.page(params[:id])
  end

  def create
    item = Item.find(params[:item_id])
    arrival = Arrival.new(arrival_params)
    arrival.item_id = item.id
    arrival.save
    redirect_to admin_item_path(item.id)
  end

  private
  def arrival_params
    params.require(:arrival).permit(:arrival_count, :arrival_date)
  end
end

