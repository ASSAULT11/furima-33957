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
- has_many :purchase

## furimas テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | text       | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| shipping_id | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| send_day_id | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| user        | references | null: false, foreign_key: true |
| furima      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :furima
- has_one :buy

## buys テーブル

| Column         | Type       | Options                   |
| -------------- | ---------- | ------------------------- |
| postal_code    | string     | null: false               |
| prefectures_id | integer    | null: false               |
| city           | string     | null: false               |
| address        | string     | null: false               |
| building       | string     |                           |
| phone          | string     | null: false               |
| purchase       | references | null: false, unique: true |

### Association

- belongs_to :purchase