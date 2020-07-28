FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 { 'test@gmail.com' }
    password              { '00000a' }
    password_confirmation { '00000a' }
    first_name { '山田' }
    last_name { '太郎' }
    first_kana { 'ヤマダ' }
    last_kana { 'タロウ' }
    birth_date { 19_881_001 }
  end
end
