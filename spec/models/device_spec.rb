require 'rails_helper'

RSpec.describe Device, type: :model do
  context 'validation tests' do
    let!(:device) { create (:device) }

    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
      it { should_not allow_value("a").for(:name) }
      it { should_not allow_value("a"*41).for(:name) }
    end

    describe '#device_type' do
      it { is_expected.to validate_presence_of(:device_type) }
      it { should_not allow_value("a").for(:device_type) }
      it { should_not allow_value("a"*41).for(:device_type) }
    end

    describe 'association' do
      it { should belong_to :device_group }
    end
  end
end
