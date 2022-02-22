FactoryBot.define do
  factory :batch do
    name   { Faker::Name }
    weight { 15 }
    meditate_unit { 'toneladas' }
  end
end