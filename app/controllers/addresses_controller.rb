class AddressesController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy, :update]

  def index
    @addresses = Address.all

  end

  def show

  end

  def new
    @address = Address.new(user_id: params[:user_id])
    @user = current_user.id

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end
end
