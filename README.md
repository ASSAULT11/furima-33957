# README

# テーブル設計

## users テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| nickname             | string     | null: false |
| email                | string     | null: false |
| encrypted_password   | string     | null: false |
| last_name            | string     | null: false |
| first_name           | string     | null: false |
| kana_last            | string     | null: false |
| kana_first           | string     | null: false |
| birthday             | data       | null: false |

### Association

- has_many :furimas
- belongs_to :buy_id

## furimas テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item        | text       | null: false |
| text        | text       | null: false |
| category_id | integer    | null: false |
| state_id    | integer    | null: false |
| shipping_id | integer    | null: false |
| area_id     | integer    | null: false |
| send_day_id | integer    | null: false |
| price       | integer    | null: false |
| user        | references |             |

### Association

- belongs_to :user
- belongs_to :buy_id

## buy_ids テーブル

| user        | references |             |
| furima      | references |             |

### Association

- has_one :user
- has_one :furima
- belongs_to :buy

## buys テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | string     | null: false |
| prefectures | string     | null: false |
| city        | string     | null: false |
| address     | string     | null: false |
| building    | string     |             |
| phone       | integer    | null: false |
| buy_id      | references |             |

### Association

- has_one :buy_id