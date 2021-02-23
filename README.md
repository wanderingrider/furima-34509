# テーブル設計

## userテーブル 

| Column    | Type    | Option      |
| ----------| ------- | ----------- | 
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| read_name | string  | null: false |
| birthday  | integer | null: false |

### Association

- has_many :items

 ## items テーブル

 | Column         | Type       |     Option                           |
 | -------------- | ---------- | ------------------------------ |
 | image          |            | null: false                    |
 | product_name   | string     | null: false                    |
 | description    | text       | null: false                   |
 | category       | string     | null: false                    | 
 | product_status | string     | null: false                    | 
 | user           | references | null: false, foreign_key: true |
 
### Association

- belongs_to :users
- belongs_tp :shipping

## shippingテーブル

| Column          | Type    | Option      |
| --------------- | --------| ----------- |
| shipping_charge | string  | null: false |
| prefecture      | string  | null: false |
| shipping_date   | string  | null: false |
| price           | integer | null: false |

### Association
- belongs_to :items
- belongs_to :purchase

## purchaseテーブル

| Column              | Type    | Option      | 
| ------------------- | ------- | ----------  |
| postal_code         | integer | null: false |
| purchase_prefecture | string  | null: false |
| municipality        | string  | null: false |
| building            | string  | null: false |
| phone_number        | integer | null: false |

### Association

- belongs_to :shippings