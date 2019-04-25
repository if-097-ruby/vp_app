FactoryBot.define do
  factory :device, class: Device do
    name {Faker::Name.name}
    device_type {Faker::Name.first_name}
    association :device_group
  end
end

  
