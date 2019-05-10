require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let!(:user) { create(:user) }

    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe '#first_name' do
      it { is_expected.to validate_presence_of(:first_name) }
    end

    describe '#last_name' do
      it { is_expected.to validate_presence_of(:last_name) }
    end

    describe '#email' do
      it { should_not allow_value("blah").for(:email) }
      it { should allow_value("a@b.com").for(:email) }
    end

    describe '#role' do
      it "has default 'member' role" do
        expect(user.role).to eq('member')
      end

      it "might have 'admin' role" do
        user.admin!
        expect(user.role).to eq('admin')
      end

      it "might have 'super_admin' role" do
        user.super_admin!
        expect(user.role).to eq('super_admin')
      end

      it { should allow_values('member', 'admin', 'super_admin').for(:role) }
    end

    describe 'association' do
      it { should belong_to :organization }
    end
  end
end
