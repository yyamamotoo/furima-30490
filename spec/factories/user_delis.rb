FactoryBot.define do
  factory :user_deli do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { '横浜' }
    addresses { "青葉" }
    building { 'ビル' }
    phone_number { '08011112222' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
