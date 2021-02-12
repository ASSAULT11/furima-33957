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
      end
      context '新規登録できないとき' do
        it "imageが空だと登録できない" do
          @furima.image = nil
          @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
end