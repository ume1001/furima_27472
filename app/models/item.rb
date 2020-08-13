class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :area
  belongs_to_active_hash :deliverytime

  belongs_to :user
  has_one :purchase
  has_one :address

  has_one_attached :image

  with_options presence: true do
    validates :text
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :deliveryfee_id
    validates :area_id
    validates :deliverytime_id
  end
end
