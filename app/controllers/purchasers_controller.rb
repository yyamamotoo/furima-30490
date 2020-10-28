class PurchasersController < ApplicationController
  before_action :authenticate_user!
  before_action :deli, only: [:index, :create]
  before_action :redirect, only: [:index]

  def index
    @user_deli = UserDeli.new
  end

  def create
    @user_deli = UserDeli.new(deli_params)

    if @user_deli.valid?
      pay_item
      @user_deli.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def deli_params
    params.require(:user_deli).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: deli_params[:token],
      currency: "jpy",
    )
  end

  def deli
    @item = Item.find(params[:item_id])
  end

  def redirect
    if @item.purchaser.present? || current_user == @item.user
      redirect_to root_path
    end
  end
end
