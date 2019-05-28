FactoryBot.define do
  factory :device_group do
    name { Faker::Company.suffix }
    organization
  end
end
