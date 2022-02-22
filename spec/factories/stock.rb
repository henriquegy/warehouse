FactoryBot.define do
  factory :stock do
    name { Faker::Name }

    trait :with_a_batches do
      after(:build) do |stock|
        stock.batch << FactoryBot.build(:batch)
      end
    end
  end
end