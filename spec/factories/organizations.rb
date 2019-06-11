FactoryBot.define do
  factory :organization do
    name { Faker::Company.unique.name }

    trait :has_one_device_group do
      after(:create) do |organization|
        create(:device_group, organization: organization)
      end
    end

    trait :has_many_device_groups do
      after(:create) do |organization|
        create_list(:device_group, 5, organization: organization)
      end
    end 

    trait :has_one_device do
      after(:create) do |organization|
        create_list(:device, 5, organization: organization)
      end
    end

    trait :has_many_device_groups do
      after(:create) do |organization|
        create_list(:device_group, organization: organization)
      end
    end   
  end
end
