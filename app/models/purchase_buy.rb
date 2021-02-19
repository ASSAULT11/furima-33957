class PurchaseBuy
  include ActiveModel::Model
  attr_accessor :furima_id, :user_id, :postal_code, :prefecture, :city, :address, :building, :phone, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone
    validates :user_id
    validates :furima_id
  end

  validates :prefecture, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(furima: furima_id, user_id: user_id)
    Buy.create(postal_code: postal_code, prefecture: prefecture,city: city, address: address, building: building, phone: phone,purchase_id: purchase.id)
  end
end