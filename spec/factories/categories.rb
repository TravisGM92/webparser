FactoryBot.define do
  factory :category do
    keyword { Faker::Commerce.material }
    supplement
  end
end
