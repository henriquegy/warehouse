FactoryBot.define do
  factory :product_entry, class: ProductEntry do
    weight   { 0 }
    meditate_unit { 'toneladas' }

    trait :with_a_stocks do
      after(:build) do |product_entry|
        product_entry.stock << FactoryBot.build(:stock, :with_a_batches)
      end
    end
  end
end