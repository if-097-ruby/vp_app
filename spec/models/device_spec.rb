require 'rails_helper'

RSpec.describe Device, type: :model do
  context 'validation tests' do
    let!(:device) { create(:device) }

    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe '#device_type' do
      it { is_expected.to validate_presence_of(:device_type) }
    end

    describe 'association' do
      it { should belong_to :device_group }
    end
  end
end
