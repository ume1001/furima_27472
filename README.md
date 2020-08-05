# furima_27472 DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|birth_date|integer|null: false|
### Association
- has_many :items
- has_many :comments
- has_many :item_purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|text|text|null: false|
|status|integer|null: false|
|deliveryfee|integer|null: false|
|area|integer|null: false|
|deliverytime|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belong_to :user
- has_one :address
- has_many :comments
- has_many :item_purchases

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefectures|integer|null: false|
|city|integer|null: false|
|address|text|null: false|
|building|text|null: false|
|phone|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## item_purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item