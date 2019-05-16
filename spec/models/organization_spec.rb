require 'rails_helper'

RSpec.describe Organization, type: :model do
  context 'validation tests' do
    let!(:organization) { create(:organization) }

    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe 'association' do
      it { should have_many :users }
      it { should have_many :device_groups }
    end
  end
end
