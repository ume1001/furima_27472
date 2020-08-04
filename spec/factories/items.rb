FactoryBot.define do
  factory :item do
    image           { File.open("#{Rails.root}/spec/fixtures/test_image.jpg") }
    name            { 'aaa' }
    text            { 'aaa' }
    category_id        { 3 } 
    status_id          { 2 } 
    deliveryFee_id     { 2 }
    area_id            { 2 } 
    deliveryTime_id    { 2 } 
    price             { 300 } 

    association :user
  end
end
