require 'rails_helper'

RSpec.describe Device, type: :model do
  subject {
    described_class.new(name: "Anything", device_type: "Lorem ipsum", device_group_id: "1")
  }

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without device_type" do
    subject.device_type = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without device_group_id" do
    subject.device_group_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with name, shorter than 3 symbols" do
    subject.name = "AB"
    expect(subject).to_not be_valid
  end
  
end
