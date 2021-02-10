require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
       user = FactoryBot.build(:user)
       user.nickname = '' 
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
       user = FactoryBot.build(:user)
       user.email = '' 
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "passwordが空では登録できない" do
      user = FactoryBot.build(:user)
      user.password = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it "last_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
     end
     it "last_nameが漢字・平仮名・カタカナ以外では登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = 'aaa' 
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
     end
     it "first_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = '' 
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
     end
     it "first_nameが漢字・平仮名・カタカナ以外では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = 'aaa' 
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
     end
     it "kana_lastが空では登録できない" do
      user = FactoryBot.build(:user)
      user.kana_last = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Kana last can't be blank")
     end
     it "kana_lastが全角カタカナ以外では登録できない" do
      user = FactoryBot.build(:user)
      user.kana_first = 'さとう' 
      user.valid?
      expect(user.errors.full_messages).to include("Kana last can't be blank")
     end
     it "kana_firstが空では登録できない" do
      user = FactoryBot.build(:user)
      user.kana_first = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Kana first can't be blank")
     end
     it "kana_firstが全角カタカナ以外では登録できない" do
      user = FactoryBot.build(:user)
      user.kana_first = 'たろう' 
      user.valid?
      expect(user.errors.full_messages).to include("Kana first can't be blank")
     end
     it "birthdayが空では登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = '' 
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end