FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    organization
    
    association :own_organization, factory: :organization

    trait :super_admin do
      role { "super_admin" }    
    end

    factory :super_admin, traits: [:super_admin]
  end
end
