FactoryBot.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::IDNumber.valid }
  end
end