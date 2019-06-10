FactoryBot.define do
  factory :presentation do
    name { Faker::Name.name }
    attachment { File.open("#{Rails.root}/spec/fixtures/myfiles/makoginm-cv.doc") }
    user
  end
end
