FactoryBot.define do
  factory :item do
    image           { File.open("#{Rails.root}/spec/fixtures/test_image.jpg") }
    name            { 'aaa' }
    text            { 'aaa' }
    category_id        { 3 }
    status_id          { 2 }
    deliveryfee_id     { 2 }
    area_id            { 2 }
    deliverytime_id    { 2 }
    price { 300 }

    association :user
  end
end
