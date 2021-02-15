require 'rails_helper'
 RSpec.describe Furima, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.build(:furima, user_id: @user.id)
  end

    describe "商品出品新規登録" do
      context '新規登録できるとき' do
        it "新規登録の情報が全て入力されていれば登録できる" do
        expect(@furima).to be_valid
        end
        it "priceが300円なら出品できる" do
          @furima.price = '300'
          expect(@furima).to be_valid
        end
        it "priceが9,999,999円なら出品できる" do
          @furima.price = '9999999'
          expect(@furima).to be_valid
        end
        it "priceが半角なら出品できる" do
          @furima.price = '1000'
          expect(@furima).to be_valid
        end
      end
      context '新規登録できないとき' do
        it "imageが空だと登録できない" do
          @furima.image = nil
          @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
        end
        it "itemが空では登録できない" do
          @furima.item = '' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Item can't be blank")
        end
        it "textが空では登録できない" do
          @furima.text = '' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Text can't be blank")
        end
        it "category_idが1では登録できない" do
          @furima.category_id = '1' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Category must be other than 1")
        end
        it "state_idが1では登録できない" do
          @furima.state_id = '1' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("State must be other than 1")
        end
        it "shipping_idが1では登録できない" do
          @furima.shipping_id = '1' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Shipping must be other than 1")
        end
        it "area_idが1では登録できない" do
          @furima.area_id = '1' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Area must be other than 1")
        end
        it "send_day_idが1では登録できない" do
          @furima.send_day_id = '1' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Send day must be other than 1")
        end
        it "priceが空では登録できない" do
          @furima.price = '' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Price can't be blank")
        end
        it "priceが全角では登録できない" do
          @furima.price = '１０００' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Price is not included in the list")
        end
        it "priceが300以下では登録できない" do
          @furima.price = '299' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Price is not included in the list")
        end
        it "priceが9,999,999以上では登録できない" do
          @furima.price = '19999999' 
          @furima.valid?
          expect(@furima.errors.full_messages).to include("Price is not included in the list")
        end
      end
    end
end