FactoryBot.define do
  factory :furima do
    association :user
    item              {'kkk'}
    text              {'kkk'}
    category_id       {2}
    state_id          {2}
    shipping_id       {2}
    area_id           {2}
    send_day_id       {2}
    price             {1000}

    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
