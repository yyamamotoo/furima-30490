FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    info { Faker::Lorem.sentence }
    item_category_id { Faker::Number.between(from: 2, to: 11) }
    item_sales_status_id { Faker::Number.between(from: 2, to: 7) }
    item_shipping_fee_status_id { Faker::Number.between(from: 2, to: 3) }
    item_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    item_scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end

    association :user
  end
end
