require 'rails_helper'

RSpec.describe LineItem, type: :model do
  subject { FactoryBot.create(:line_item) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
