require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報登録' do
    context '商品登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kanaが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
