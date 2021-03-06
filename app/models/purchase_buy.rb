class PurchaseBuy
  include ActiveModel::Model
  attr_accessor :furima_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A[0-9]+\z/}, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :furima_id
  end

  validates :prefecture_id, numericality: {other_than: 1}

  def save
    purchase = Purchase.create(furima_id: furima_id, user_id: user_id)
    Buy.create(postal_code: postal_code, prefectures_id: prefecture_id,city: city, address: address, building: building, phone: phone, purchase_id: purchase.id)
  end
end