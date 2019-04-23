require 'rails_helper'

RSpec.describe Organization, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      organization = Organization.new(name: 'Sample').save
      expect(organization).to eq(true)
    end
    it 'should save succesfully' do
      organization = Organization.new(name: 'Sample').save
      expect(organization).to eq(true)
    end
  end
end
