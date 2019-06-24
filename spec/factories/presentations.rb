FactoryBot.define do
  factory :presentation do
    name { Faker::Name.name }
    attachment { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/myfiles/IF-097.Ruby.pdf")) }
    user
  end
end
