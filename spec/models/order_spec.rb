require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { FactoryBot.create(:order) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
