require 'rails_helper'

RSpec.describe User, type: :model do
   
  context 'super_admin is no exist' do
    let!(:user) { build(:user) }
    it 'send one email to user after creation' do 
      expect{user.save}.to change{ActionMailer::Base.deliveries.count}.by(1)
    end
  end  

  context 'super_admin exists' do
    let!(:user) { build(:super_admin) }
    it 'send email to user and super_admin after creation' do
      expect{user.save}.to change{ActionMailer::Base.deliveries.count}.by(2)
    end
  end  

  context 'validation tests' do
    let!(:user) { create(:user) }

    describe 'factory' do
      it { is_expected.to be_truthy }
    end
    
    describe 'belong_to organization' do
      it { is_expected.to belong_to(:organization) }
    end  
     
    describe 'nested attribute' do
      it { is_expected.to accept_nested_attributes_for(:own_organization) }
    end

    describe '#first_name' do
      it { is_expected.to validate_presence_of(:first_name) }
    end
    describe '#last_name' do
      it { is_expected.to validate_presence_of(:last_name) }
    end

    describe '#email' do
      it { is_expected.not_to allow_value("blah").for(:email) }
      it { is_expected.to allow_value("a@b.com").for(:email) }
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

      it { is_expected.to allow_values('member', 'admin', 'super_admin').for(:role) }
    end

    describe 'association' do
      it { is_expected.to belong_to :organization }
    end
  end
end
