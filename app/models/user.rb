class User < ApplicationRecord
  has_many :furimas
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :birthday
  
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :last_name
      validates :first_name
    end
  
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :kana_last
      validates :kana_first
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end

