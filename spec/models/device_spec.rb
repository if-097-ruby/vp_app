require 'rails_helper'

RSpec.describe Device, type: :model do
  let!(:device) { create (:device) }

  it "is valid with valid params" do
    expect(device.save).to eq(true)
  end

  it "is not valid without name" do
    device.name = nil
    expect(device.save).to eq(false)
  end

  it "is not valid without device_type" do
    device.device_type = nil
    expect(device.save).to eq(false)
  end

  it "is not valid with name, shorter than 3 symbols" do
    device.name = "AB"
    expect(device.save).to eq(false)
  end

end
