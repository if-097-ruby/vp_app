require 'rails_helper'

RSpec.describe DeviceGroup, type: :model do
  subject {
    described_class.new(name: "Anything", organization_id: "1")
  }


   it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without oraganization_id" do
    subject.organization_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with name, shorter than 3 symbols" do
    subject.name = "AB"
    expect(subject).to_not be_valid
  end

  

end
