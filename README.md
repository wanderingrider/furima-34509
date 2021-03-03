# テーブル設計

## usersテーブル 

| Column              | Type    | Options                   |
| ------------------- | --------| --------------------------|
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| surname             | string  | null: false               |
| first_name          | string  | null: false               |
| read_surname        | string  | null: false               |
| read_first_name     | string  | null:false                |
| birthday            | date    | null: false               |

### Association

- has_many :items
- has_many :shippings

## items テーブル

| Column             | Type       |     Options                    |
| ---------------    | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    | 
| product_status_id  | integer    | null: false                    | 
| shipping_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
 
### Association

- belongs_to :user
- has_one    :shipping

## shippingsテーブル

| Column          | Type       | Options                        |
| --------------- | --------   | -----------                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :purchase
- belongs_to :user

## purchaseテーブル

| Column                 | Type       | Options                       | 
| -------------------    | ---------- | ----------------------------  |
| postal_code            | string     | null: false                   |
| prefecture_id          | integer    | null: false                   |
| municipality           | string     | null: false                   |
| address                | string     | null: false                   |
| building               | string     |                               | 
| phone_number           | string     | null: false                   |
| shipping               | references | null:false, foreign_key: true |

### Association 

- belongs_to :shipping