class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item, only: [:edit, :show, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user == @item.user
      render :edit
    else current_user != @item.user
      redirect_to root_path     end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id,
                                 :item_prefecture_id, :item_scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def item
    @item = Item.find(params[:id])
  end
end
