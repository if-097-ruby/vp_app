FactoryBot.define do
  factory :user, class: 'Account::User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name } 
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    role { 'member' }
    organization
  end
end
