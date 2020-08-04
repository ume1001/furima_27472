FactoryBot.define do
  factory :item do
    image           { File.open("#{Rails.root}/public/images/test_image.jpg") }
    name            { 'aaa' }
    text            { 'aaa' }
    category_id        { 3 } # { FactoryBot.create(:name) }#{ 'レデース' }
    status_id          { 2 } # { FactoryBot.create(:item) }#{ '新品、未使用' }
    deliveryFee_id     { 2 } # { FactoryBot.create(:item) }#{ '着払い(購入者負担)' }
    area_id            { 2 } # { FactoryBot.create(:item) }#{ '北海道' }
    deliveryTime_id    { 2 } # { FactoryBot.create(:item) }#{ '2〜2日で発送' }
    price { 300 } # { FactoryBot.create(:item) }#{ '300' }

    association :user
  end
end
