class Furima < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :send_day


  with_options presence: true do
    validates :item
    validates :text
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :shipping_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :send_day_id, numericality: { other_than: 1 } 
end