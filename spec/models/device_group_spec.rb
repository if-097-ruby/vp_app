require 'rails_helper'

RSpec.describe DeviceGroup, type: :model do
  context 'validations tests' do
    let!(:device_group) { create(:device_group) }

    describe '#name' do
      it { should validate_presence_of(:name) }
    end

    describe '#organization_id' do
      it { should validate_presence_of(:organization) }
    end

    describe 'association' do
      it { should belong_to :organization }
    end
  end
end
