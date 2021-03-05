require 'rails_helper'

RSpec.describe ShippingPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.5
    @shipping_purchase = FactoryBot.build(:shipping_purchase, user_id: user.id, item_id: item.id)
  end
  describe '購入時に複数のテーブルに購入者情報を保存できるか' do
    context '購入者情報を保存できるとき' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@shipping_purchase).to be_valid
      end
      it '建物名がなくても保存できる' do
        @shipping_purchase.building = ''
        expect(@shipping_purchase).to be_valid
      end
    end

    context '購入者情報を保存できないとき' do
      it '郵便番号がないと保存できない' do
        @shipping_purchase.postal_code = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県情報がないと保存ができない' do
        @shipping_purchase.prefecture_id = 1
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市町村情報がないと保存できない' do
        @shipping_purchase.municipality = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地情報がないと保存ができない' do
        @shipping_purchase.address = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと保存できない' do
        @shipping_purchase.phone_number = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は英数混合では登録できない'do
        @shipping_purchase.phone_number = '090aaaabbbb'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it '郵便番号の保存にはハイフンが必要' do
        @shipping_purchase.postal_code = '7778888'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '電話番号は11桁の数字以下のみ保存できる' do
        @shipping_purchase.phone_number = '888777788888'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は英数混合では保存できない' do
        @shipping_purchase.phone_number = 'aaa00000bb'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idがないと保存ができない' do
        @shipping_purchase.user_id = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと保存ができない' do
        @shipping_purchase.item_id = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

  describe 'クレジットカード情報が保存できるか' do
    context 'クレジットカード情報を保存できる' do
      it '必要な情報を入力するとクレジットカード情報を入力すると保存できる' do
        expect(@shipping_purchase).to be_valid
      end
    end

    context 'クレジットカード情報を保存できないとき' do
      it 'tokenが空では保存できない' do
        @shipping_purchase.token = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
