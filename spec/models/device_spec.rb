require 'rails_helper'

RSpec.describe Device, type: :model do
  context 'validations tests' do

    describe '#name' do
      it { should validate_presence_of(:name) }
    end

    describe '#device_type' do
      it { should validate_presence_of(:device_type) }
    end    

    describe 'association' do
      it { should belong_to :organization }
    end
  end
end
