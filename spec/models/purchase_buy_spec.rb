require 'rails_helper'
 RSpec.describe PurchaseBuy, type: :model do
  before do
    @purchase_buy = FactoryBot.build(:purchase_buy)
  end

   describe "商品購入" do
    context '商品購入できるとき' do
     it "購入時の情報が全て入力されていれば登録できる" do
       expect(@purchase_buy).to be_valid
     end
     it "建物名が入力されてなくても登録できる" do
      @purchase_buy.building = ''
      expect(@purchase_buy).to be_valid
     end
    end
    context '商品購入できないとき' do
     it "postal_codeが空だと登録できない" do
       @purchase_buy.postal_code = '' 
       @purchase_buy.valid?
       expect(@purchase_buy.errors.full_messages).to include("Postal code can't be blank")
     end
     it "postal_codeに「-」がないと登録できない" do
      @purchase_buy.postal_code = '1234567' 
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
     end
     it "prefecture_idが空だと登録できない" do
      @purchase_buy.prefecture_id = 1
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Prefecture must be other than 1")
     end
     it "cityが空だと登録できない" do
      @purchase_buy.city = '' 
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("City can't be blank")
     end
     it "addressが空だと登録できない" do
      @purchase_buy.address = '' 
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Address can't be blank")
     end
     it "phoneが12桁以上では登録できない" do
      @purchase_buy.phone = '111111111111'
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
     end
     it "phoneが英数字混合では登録できない" do
      @purchase_buy.phone = 'aaa1111a111' 
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Phone is invalid")
     end
     it "phoneが空だと登録できない" do
      @purchase_buy.phone = '' 
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Phone can't be blank")
     end
     it "tokenが空だと登録できない" do
      @purchase_buy.token = '' 
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Token can't be blank")
     end
     it "user_idが空だと登録できない" do
      @purchase_buy.user_id = ''
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("User can't be blank")
     end
     it "furima_idが空だと登録できない" do
      @purchase_buy.furima_id = ''
      @purchase_buy.valid?
      expect(@purchase_buy.errors.full_messages).to include("Furima can't be blank")
     end
    end
  end
end