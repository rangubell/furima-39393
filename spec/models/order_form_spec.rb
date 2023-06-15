require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user.id)
      @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_form.postal_code = ''
        expect(@order_form).not_to be_valid
        expect(@order_form.errors[:postal_code]).to include("can't be blank")
      end
    
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_form.postal_code = '1234567'
        expect(@order_form).not_to be_valid
        expect(@order_form.errors[:postal_code]).to include("Enter it as follows (e.g. 123-4567)")
      end
    
      it 'prefecture_idが空だと保存できないこと' do
        @order_form.prefecture_id = nil
        expect(@order_form).not_to be_valid
        expect(@order_form.errors[:prefecture_id]).to include("can't be blank")
      end
    
      it 'municipalityが空だと保存できないこと' do
        @order_form.municipality = ''
        expect(@order_form).not_to be_valid
        expect(@order_form.errors[:municipality]).to include("can't be blank")
      end
    
      it 'addressが空だと保存できないこと' do
        @order_form.address = ''
        expect(@order_form).not_to be_valid
        expect(@order_form.errors[:address]).to include("can't be blank")
      end
    
      it 'phone_numberが空だと保存できないこと' do
        @order_form.phone_number = ''
        expect(@order_form).not_to be_valid
        expect(@order_form.errors[:phone_number]).to include("can't be blank")
      end
    
      it 'phone_numberが10桁未満だと保存できないこと' do
        @order_form.phone_number = '123456789'
        expect(@order_form).not_to be_valid
        expect(@order_form.errors[:phone_number]).to include("is too short (minimum is 10 characters)")
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = ''
        expect(@order_form).not_to be_valid
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end