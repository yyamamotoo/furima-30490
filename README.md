# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first-name            | string | null: false |
| last-name             | string | null: false |
| first-name-kana       | string | null: false |
| last-name-kana        | string | null: false |
| birth-date            | string | null: false |


### Association

- has_many :items
- has_one  :deliveries
- has_one  :purchasers

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | integer    | null: false                    |
| item-sales-status        | integer    | null: false                    |
| item-shipping-fee-status | integer    | null: false                    |
| item-prefecture          | integer    | null: false                    |
| item-scheduled-delivery  | integer    | null: false                    |
| item-price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## deliveries テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal-code         | string     | null: false                    |
| prefecture          | integer    | null: false                    |
| city                | string     | null: false                    |
| addresses           | string     | null: false                    |
| building            | string     | null: false                    |
| phone-number        | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## purchasers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card-number    | integer    | null: false                    |
| card-exp-month | integer    | null: false                    |
| card-exp-year  | integer    | null: false                    |
| card-cvc       | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
