require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'validation tests' do
    let!(:contact) { create(:contact) }

    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe '#message' do
      it { is_expected.to validate_presence_of(:message) }
    end

    describe '#email' do
      it { expect(contact).to_not allow_value('base@example').for(:email) }
      it { expect(contact).to allow_value('dhh@nonopinionated.com').for(:email) }
      it { is_expected.to validate_presence_of(:email) }
    end
  end
end
