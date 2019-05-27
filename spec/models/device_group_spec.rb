require 'rails_helper'

RSpec.describe DeviceGroup, type: :model do
  context 'validation tests' do
    let!(:device_group) { build(:device_group) }

    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe '#organization_id' do
      it { is_expected.to validate_presence_of(:organization_id) }
    end

    describe 'association' do
      it { should belong_to :organization }
      it { should have_many :devices }
    end
  end
end