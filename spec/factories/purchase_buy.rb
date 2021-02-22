FactoryBot.define do
  factory :purchase_buy do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'練馬区'}
    address {'1-1'}
    building {'東京ハイツ'}
    phone {"09011111111"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end