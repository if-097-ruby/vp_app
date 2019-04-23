require 'rails_helper'

  RSpec.describe User, type: :model do
    subject {
    described_class.new(first_name: "Example", last_name: "Test", email: "example@mail.com", password: "qwerty", 
    	                 password_confirmation: "qwerty", admin: true)
    }

    it "is not valid without first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

    it "is not valid without last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

    it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

    it "is not valid without passsword" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

end
