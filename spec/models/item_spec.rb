require 'rails_helper'

RSpec.describe Item, type: :model do
  #describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('test_image.jpg')
    end

    context 'can save' do
      # この中にメッセージを保存できる場合のテストを記述
      it 'is valid all items' do
        expect(@item).to be_valid
      end
    end

    context 'can not save' do
      # この中にメッセージを保存できない場合のテストを記述
      it 'is invalid without a name' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'is invalid without a image' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include
      end

      it 'is invalid without a text' do
        @item.text = nil
        @item.valid?
        expect(@item.errors[:text]).to include("can't be blank")
      end

      it 'is invalid without a category' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include('is not a number')
      end

      it 'is invalid without a status' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors[:status_id]).to include('is not a number')
      end

      it 'is invalid without a deliveryFee' do
        @item.deliveryFee_id = nil
        @item.valid?
        expect(@item.errors[:deliveryFee_id]).to include('is not a number')
      end

      it 'is invalid without a area' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors[:area_id]).to include('is not a number')
      end

      it 'is invalid without a deliveryTime' do
        @item.deliveryTime_id = nil
        @item.valid?
        expect(@item.errors[:deliveryTime_id]).to include('is not a number')
      end

      it 'is invalid without a price' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it 'is invalid without a price that has less than 300 yen' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors[:price]).to include()
      end

      it 'is invalid without a price that has more than 9,999,999 yen' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors[:price]).to include()
      end
    end
  end
end
