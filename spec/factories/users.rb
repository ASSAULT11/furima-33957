FactoryBot.define do
  factory :user do
    nickname              {'ryu'}
    email                 {'kkk@gmail.com'}
    password              {'1234asd'}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'太郎'}
    kana_last             {'サトウ'}
    kana_first            {'タロウ'}
    birthday              {'2000-01-01'}
  end
end