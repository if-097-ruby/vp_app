FactoryBot.define do
  factory :device do
    name { Faker::Company.suffix }
    device_type { Faker::Company.suffix }
    organization
  end
end
