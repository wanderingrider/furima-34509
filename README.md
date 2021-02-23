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
| read_first_name     | string  |                           |
| birthday            | date    | null: false               |

### Association

- has_many :items

 ## items テーブル

 | Column         | Type       |     Options                    |
 | -------------- | ---------- | ------------------------------ |
 | image          |            | null: false                    |
 | product_name   | string     | null: false                    |
 | description    | text       | null: false                    |
 | category       | string     | null: false                    | 
 | product_status | string     | null: false                    | 
 | user           | references | null: false, foreign_key: true |
 
### Association

- belongs_to :users
- belongs_tp :shipping

## shippingsテーブル

| Column          | Type    | Options     |
| --------------- | --------| ----------- |
| shipping_charge | string  | null: false |
| prefecture      | string  | null: false |
| shipping_date   | string  | null: false |
| price           | integer | null: false |

### Association
- belongs_to :items
- belongs_to :purchase

## purchaseテーブル

| Column                 | Type    | Options     | 
| -------------------    | ------- | ----------  |
| postal_code            | string  | null: false |
| purchase_prefecture_id | integer | null: false |
| municipality           | string  | null: false |
| address                | string  | null: false |
| building               | string  |             | 
| phone_number           | string  | null: false |

### Association

- belongs_to :shippings