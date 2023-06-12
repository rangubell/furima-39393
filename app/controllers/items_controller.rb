class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order(created_at: :desc)
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

  private

  def item_params
    params.require(:item).permit(:item, :description, :image, :category_id, :condition_id, :shipping_fee_id, :shipping_origin_id,
                                 :shipping_duration_id, :price).merge(user_id: current_user.id)
  end
end
