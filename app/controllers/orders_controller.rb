class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :show, :create, :edit, :update, :complete]

  def index

  end

  def show

  end

  def create

  end

  def edit

  end

  def update

  end

  def complete

  end
end
