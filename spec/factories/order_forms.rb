FactoryBot.define do
  factory :order_form do
    postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number { Faker::PhoneNumber.cell_phone.gsub(/[^\d]/, '') }
  end
end
