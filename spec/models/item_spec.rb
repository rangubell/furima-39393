require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.user = @user
  end

  describe '商品情報登録' do
    context '商品登録できるとき' do
      it 'itemとdescription、category_idとcondition_id、shipping_fee_idとshipping_origin_id、shipping_duration_idとpriceとimageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it 'itemが空では登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_origin_idが空では登録できない' do
        @item.shipping_origin_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it 'shipping_duration_idが空では登録できない' do
        @item.shipping_duration_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角入力では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'category_idが1の場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選んでください')
      end

      it 'condition_idが1の場合は登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を選んでください')
      end

      it 'shipping_fee_idが1の場合は登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee を選んでください')
      end

      it 'shipping_origin_idが1の場合は登録できない' do
        @item.shipping_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping origin を選んでください')
      end

      it 'shipping_duration_idが1の場合は登録できない' do
        @item.shipping_duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping duration を選んでください')
      end
    end
  end
end
