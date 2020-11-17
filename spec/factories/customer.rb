FactoryBot.define do
  factory :customer do
    sequence(:email){|n| "member#{n}@example.jp"}
    family_name { "山田" }
    given_name { "太郎" }
    family_name_kana { "ヤマダ" }
    given_name_kana { "タロウ" }
    password { "pw" }
    birthday { Date.new(1970, 1, 1) }
    gender { "male" }
    association :home_address, strategy: :build
    association :work_address, strategy: :build
  end

  factory :work_address do
    company_name { "テスト" }
    division_name { "開発部" }
    postal_code { "1050000" }
    prefecture { "東京都"}
    city { "港区" }
    address1 { "試験 1-1-1" }
    address2 { "" }
  end
end