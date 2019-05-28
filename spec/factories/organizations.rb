FactoryBot.define do
  factory :organization do
    name { Faker::Company.unique.name }

    factory :organization_with_device_group do
      after(:create) do |organization|
        create(:device_group, organization: organization)
      end
    end
  end
end
