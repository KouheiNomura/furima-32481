# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shopping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone_number | string  | null: false |

### Association

- has_many :purchase_records

## purchase_records テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address