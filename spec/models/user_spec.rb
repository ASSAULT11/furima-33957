require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    context '新規登録できるとき' do
     it "新規登録の情報が全て入力されていれば登録できる" do
       expect(@user).to be_valid
     end
    end
    context '新規登録できないとき' do
     it "nicknameが空だと登録できない" do
       @user.nickname = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
       @user.email = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailに@がなければ登録できない" do
      @user.email = 'kkkgmail.com' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
     it "passwordが空では登録できない" do
      @user.password = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordとpassword_confirmationの値が一致していない場合、登録できない" do
      @user.password = '1234asd' 
      @user.password_confirmation = '5678asd' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordが６文字以上でないと登録できない" do
      @user.password = '123qw' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "passwordが英語のみでは登録できない" do
      @user.password = 'aaaaaaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordが数字のみでは登録できない" do
      @user.password = '1111111' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordが全角では登録できない" do
      @user.password = '１２３ＡＳＤＦ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "last_nameが空では登録できない" do
      @user.last_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it "last_nameが漢字・平仮名・カタカナ以外では登録できない" do
      @user.last_name = 'aaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it "first_nameが空では登録できない" do
      @user.first_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it "first_nameが漢字・平仮名・カタカナ以外では登録できない" do
      @user.first_name = 'aaa' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it "kana_lastが空では登録できない" do
      @user.kana_last = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last can't be blank")
     end
     it "kana_lastが全角カタカナ以外では登録できない" do
      @user.kana_last = 'さとう' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid")
     end
     it "kana_firstが空では登録できない" do
      @user.kana_first = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first can't be blank")
     end
     it "kana_firstが全角カタカナ以外では登録できない" do
      @user.kana_first = 'たろう' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
     end
     it "birthdayが空では登録できない" do
      @user.birthday = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end
   end
 end