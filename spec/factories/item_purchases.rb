FactoryBot.define do
  factory :item_purchase do
    postal_code          { '123-4567' }
    area_id              { 1 }
    prefectures          { 'あああ' }
    city                 { '123' }
    building             { 'ビル101' }
    phone                { '00000000000' }
  end
end
