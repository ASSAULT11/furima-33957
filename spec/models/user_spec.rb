require 'rails_helper'
 RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
     it "nicknameが空だと登録できない" do
       user = User.new(nickname: "", email: "kkk@gmail.com", password: "1234asd", password_confirmation: "1234asd", last_name: "佐藤", first_name: "太郎", kana_last: "サトウ", kana_first: "タロウ", birthday: "2000-01-01")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      user = User.new(nickname: "ryu", email: "", password: "1234asd", password_confirmation: "1234asd", last_name: "佐藤", first_name: "太郎", kana_last: "サトウ", kana_first: "タロウ", birthday: "2000-01-01")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "passwordが空では登録できない" do
      user = User.new(nickname: "ryu", email: "kkk@gmail.com", password: "", password_confirmation: "", last_name: "佐藤", first_name: "太郎", kana_last: "サトウ", kana_first: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it "last_nameが空では登録できない" do
      user = User.new(nickname: "ryu", email: "kkk@gmail.com", password: "1234asd", password_confirmation: "1234asd", last_name: "", first_name: "太郎", kana_last: "サトウ", kana_first: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
     end
     it "first_nameが空では登録できない" do
      user = User.new(nickname: "ryu", email: "kkk@gmail.com", password: "1234asd", password_confirmation: "1234asd", last_name: "佐藤", first_name: "", kana_last: "サトウ", kana_first: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
     end
     it "kana_lastが空では登録できない" do
      user = User.new(nickname: "ryu", email: "kkk@gmail.com", password: "1234asd", password_confirmation: "1234asd", last_name: "佐藤", first_name: "太郎", kana_last: "", kana_first: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Kana last can't be blank")
     end
     it "kana_firstが空では登録できない" do
      user = User.new(nickname: "ryu", email: "kkk@gmail.com", password: "1234asd", password_confirmation: "1234asd", last_name: "佐藤", first_name: "太郎", kana_last: "サトウ", kana_first: "", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Kana first can't be blank")
     end
     it "birthdayが空では登録できない" do
      user = User.new(nickname: "ryu", email: "kkk@gmail.com", password: "1234asd", password_confirmation: "1234asd", last_name: "佐藤", first_name: "太郎", kana_last: "サトウ", kana_first: "タロウ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end