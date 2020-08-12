class ItemPurchase
  include ActiveModel::Model
  attr_accessor :image, :name, :text, :category_id, :status_id, :deliveryfee_id, :area_id, :deliverytime_id, :price, :postal_code, :area_id, :prefectures, :city, :building, :phone, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include include hyphen(-)' }
    validates :phone, format: { with: /\A\d{11}\z/ }
    validates :prefectures
    validates :city
  end

  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefectures: prefectures, city: city, area_id: area_id, building: building, phone: phone, item_id: item_id)
    # 購入の情報を保存
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end
