class AddressesController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :destroy, :update]

  def index
    @user = User.find(params[:user_id])
    @addresses = @user.addresses.all
  end

  def show

  end

  def new
    @address = Address.new(user_id: params[:user_id])
    @user = current_user.id
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to user_addresses_path(@address.user.id)
    else
      puts @address.errors.full_messages
      render :new
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_addresses_path(@address.user.id)
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to user_addresses_path(@address.user.id)
  end

  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_kana_name, :last_kana_name, :prefecture, :city_address, :building, :postal_code, :tel_number)
  end
end
