require 'rails_helper'

RSpec.describe Account::User, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }

    it 'is valid with valid attributes' do
      expect(user.save).to eq(true)
    end
    
    it "is not valid without a first name" do
      user.first_name = nil
      expect(user.save).to_not eq(true)
    end
    
    it "is not valid with too short first name" do
      user.first_name = "A"
      expect(user.save).to_not eq(true)
    end    

    it "is not valid without a last name" do
      user.last_name = nil
      expect(user.save).to_not eq(true)
    end

    it "is not valid without @ in email" do
      user.email = "omnomnom"
      expect(user.save).to_not eq(true) 
    end

    it "has default 'member' role" do
      expect(user.role).to eq('member')
    end
  end
end
