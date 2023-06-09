FactoryBot.define do
  factory :item do
    item { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    shipping_origin_id { Faker::Number.between(from: 2, to: 48) }
    shipping_duration_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images/star.png'), 'image/jpeg') }
    association :user
  end
end
