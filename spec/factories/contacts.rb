FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    message { Faker::Lorem.paragraph }
  end
end
