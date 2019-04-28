FactoryBot.define do
  factory :device_group do
    name { Faker::Name.name }
    organization
  end
end
