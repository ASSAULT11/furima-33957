# README

# テーブル設計

## users テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| nickname   | string     | null: false |
| email      | string     | null: false |
| password   | string     | null: false |
| name       | string     | null: false |
| kana_name  | string     | null: false |
| year       | data       | null: false |
| month      | data       | null: false |
| day        | data       | null: false |
| buy        | references |             |

### Association

- has_many :furimas
- belongs_to :buy

## furimas テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| image      |            |             |
| item       | text       | null: false |
| text       | text       | null: false |
| category   | string     | null: false |
| state      | string     | null: false |
| shipping   | string     | null: false |
| area       | string     | null: false |
| send_day   | string     | null: false |
| price      | integer    | null: false |
| user       | references |             |

### Association

- has_many :buys
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