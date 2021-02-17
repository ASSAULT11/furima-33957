class Buy < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone
  end

  validates :prefectures_id, numericality: { other_than: 1 }
end