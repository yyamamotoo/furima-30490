FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 10, mix_case: true) }
    password_confirmation { password }
    birth_date { Faker::Date.between(from: "2020-10-01", to: "2020-10-31") }
    first_name { Gimei.first.kanji }
    last_name { Gimei.last.kanji }
    first_name_kana { Gimei.first.katakana }
    last_name_kana { Gimei.last.katakana }
  end
end
