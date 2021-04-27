FactoryBot.define do
  factory :supplement do
    title { Faker::Commerce.material }
    summary { Faker::Lorem.paragraph }
  end
end
