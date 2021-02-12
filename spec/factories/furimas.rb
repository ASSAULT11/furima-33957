FactoryBot.define do
  factory :furima do
    image             {app/assets/images/flag.png}
    item              {'kkk'}
    text              {'kkk'}
    category_id       {'ベビー・キッズ'}
    state_id          {'傷や汚れあり'}
    shipping_id       {'送料込み(出品者負担)'}
    area_id           {'千葉県'}
    send_day_id       {'1〜2日で発送'}
    price             {'1000'}
  end
end
