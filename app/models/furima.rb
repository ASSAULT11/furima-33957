class Furima < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
end





## furimas テーブル     ＊*バリデーションを記述したら「絶対」消すこと＊＊

#| Column      | Type       | Options                        |
#| ----------- | ---------- | ------------------------------ |
#| item        | text       | null: false                    |
#| text        | text       | null: false                    |
#| category_id | integer    | null: false                    |
#| state_id    | integer    | null: false                    |
#| shipping_id | integer    | null: false                    |
#| area_id     | integer    | null: false                    |
#| send_day_id | integer    | null: false                    |
#| price       | integer    | null: false                    |
#| user        | references | null: false, foreign_key: true |
