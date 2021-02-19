class PurchaseBuy < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :furima_id, :user_id, :postal_code, :prefecture, :city, :address, :building, :phone

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone
  end

  validates :prefectures_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(furima: furima_id, user_id: user_id)
    Buy.create(postal_code: postal_code, prefecture: prefecture,city: city, address: address, building: building, phone: phone,purchase_id: purchase.id)
  end
end