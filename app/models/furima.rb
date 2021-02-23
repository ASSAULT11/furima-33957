class Furima < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :send_day


  with_options presence: true do
    validates :image
    validates :item
    validates :text
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :state_id
    validates :shipping_id
    validates :area_id
    validates :send_day_id
  end

  validates :price, numericality: true
end