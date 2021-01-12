require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '購入記録と住所の保存' do
    context '購入記録と住所が保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@purchase_form).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end
    context '購入記録と住所が保存できないとき' do
      it 'postal_codeが空では保存できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @purchase_form.prefecture_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにハイフンが含まれていなければ保存できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが0では保存できない' do
        @purchase_form.prefecture_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'phone_numberにハイフンが含まれていれば保存できない' do
        @purchase_form.phone_number = '090-1234-5678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以内でなければ保存できない' do
        @purchase_form.phone_number = '090123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では保存できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できない' do
        @purchase_form.user_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'user_idが空では保存できない' do
        binding.pry
        @purchase_form.item_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
