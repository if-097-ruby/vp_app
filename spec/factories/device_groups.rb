FactoryBot.define do
  factory :device_group, class: DeviceGroup do
    name { Faker::Name.name }
    organization
  end
end
