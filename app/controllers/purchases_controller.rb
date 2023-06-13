# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def new
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.save
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id)
  end
end
