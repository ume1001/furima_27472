require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '#create' do
    context 'Seller' do
      before do
        @item_purchase = FactoryBot.build(:item_purchase)
      end

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_purchase).to be_valid
      end

      it 'postal_codeが空だと保存できないこと' do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors[:postal_code]).to include("can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_purchase.postal_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postal code is invalid. Include include hyphen(-)')
      end

      it 'phoneが空だと保存できないこと' do
        @item_purchase.phone = nil
        @item_purchase.valid?
        expect(@item_purchase.errors[:phone]).to include("can't be blank")
      end

      it 'phoneは11桁以内であること' do
        @item_purchase = build(:item_purchase, phone: '00000000000')
        expect(@item_purchase).to be_valid
      end

      it 'area_idを選択していないと保存できないこと' do
        @item_purchase.area_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors[:area_id]).to include("can't be blank")
      end

      it 'prefecturesが空だと保存できないこと' do
        @item_purchase.prefectures = nil
        @item_purchase.valid?
        expect(@item_purchase.errors[:prefectures]).to include("can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors[:city]).to include("can't be blank")
      end

      it 'buildingは空でも保存できること' do
        @item_purchase.building = nil
        expect(@item_purchase).to be_valid
      end
    end

    context 'buyer' do
      before do
        it '出品者は購入できない' do
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end
