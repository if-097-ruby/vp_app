FactoryBot.define do
  factory :organization do
    name { Faker::Company.unique.name }

    factory :organization_with_device_groups do
      transient do
        groups_count { 5 }
      end

      after(:create) do |organization, evaluator|
        create_list(:device_group, evaluator.groups_count, organization: organization)
      end
    end

    factory :organization_with_devices do
      transient do
        devices_count { 5 }
      end
      
      after(:create) do |organization, evaluator|
        create_list(:device, evaluator.devices_count, organization: organization)
      end
    end
  end
end
