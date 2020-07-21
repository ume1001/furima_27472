# furima_27472 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
|kana|string|null: false|
|birthDate|integer|null: false|
### Association
- has_many :items
- has_many :comments

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|itemName|string|null: false|
|text|text|null: false|
|status|string|null: false|
|deliveryFee|string|null: false|
|area|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :customer
- belong_to :category
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## customersテーブル
|Column|Type|Options|
|------|----|-------|
|card|integer|null: false|
|address|integer|null: false|
|phone|integer|null: false|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|text|integer|null: false|
### Association
- has_many :items