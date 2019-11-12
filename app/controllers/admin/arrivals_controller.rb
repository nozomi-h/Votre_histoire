class Admin::ArrivalsController < ApplicationController

  def new

  end

  def index
    @arrivals = Arrival.page(params[:id])
  end
end
