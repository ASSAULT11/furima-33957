# README

# テーブル設計

## users テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| nickname             | string     | null: false |
| email                | string     | null: false |
| encrypted_password   | string     | null: false |
| name                 | string     | null: false |
| kana_name            | string     | null: false |
| birthday             | data       | null: false |

### Association

- has_many :furimas
- has_one :buy

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

- has_one :buy
- belongs_to :user

## buys テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | string     | null: false |
| prefectures | string     | null: false |
| city        | string     | null: false |
| address     | string     | null: false |
| building    | string     |             |
| phone       | integer    | null: false |
| user        | references |             |
| furima      | references |             |

### Association

- has_one :user
- has_one :furima