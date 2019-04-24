require 'rails_helper'

RSpec.describe DeviceGroup, type: :model do
  let(:device_group){build (:device_group)}

  it "is valid with valid params" do
  expect(device_group.save).to eq(true)
  end


  it "is not valid without name" do
    device_group.name = nil
    expect(device_group.save).to eq(false)
  end

  it "is not valid without oraganization_id" do
    device_group.organization_id = nil
    expect(device_group.save).to eq(false)
  end

  it "is not valid with name, shorter than 3 symbols" do
    device_group.name = "AB"
    expect(device_group.save).to eq(false)
  end

  

end
