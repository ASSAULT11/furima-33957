class PurchaseBuy
  include ActiveModel::Model
  attr_accessor :furima_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone
    validates :user_id
    validates :furima_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(furima: furima_id, user_id: user_id)
    Buy.create(postal_code: postal_code, prefecture_id: prefecture.id,city: city, address: address, building: building, phone: phone,purchase_id: purchase.id)
  end
end