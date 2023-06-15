class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def new
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    @order_form.price = @item.price
    if @order_form.valid?
       pay_item
       @order_form.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = "sk_test_b3b3eff5168a18ebde9a7a65"  
      Payjp::Charge.create(
        amount: @order_form.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token],)
  end
end