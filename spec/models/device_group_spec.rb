require 'rails_helper'

RSpec.describe DeviceGroup, type: :model do
  context 'validation tests' do
    let!(:device_group) { create(:device_group) }

    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
      it { should_not allow_value("aa").for(:name) }
      it { should_not allow_value("a"*41).for(:name) }
    end

    describe 'association' do
      it { should belong_to :organization }
      it { should have_many :devices }
    end
  end
end
