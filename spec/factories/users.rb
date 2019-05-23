FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    organization
    role { 'member' }
     
    trait :super_admin do
      role { "super_admin" }
    end

    trait :admin do
      role { 'admin' }
      after(:create) do |admin|
        create(:organization, admin: admin)
      end
    end

    factory :admin,       traits: [:admin]
    factory :super_admin, traits: [:super_admin]
    
  end
end
