require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { FactoryBot.create(:category) }
 
  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'name is missing' do
    it 'is not valid' do
      subject.update(name: '')
      expect(subject.errors).to have_key(:name)
    end
  end

  context 'name should not be too long' do
    it 'is not valid' do
      subject.update(name: 'a' * 141)
      expect(subject.errors[:name]).to include("140 characters is the maximum allowed")
    end
  end

  context 'description should not be too long' do
    it 'is not valid' do
      subject.update(description: 'a' * 501)
      expect(subject.errors[:description]).to include("500 characters is the maximum allowed")
    end
  end

  context 'name is not unique' do
    before { Category.create(name: 'Burger') } 
    subject { Category.create(name: 'Burger') }

    it 'is not valid' do
      expect(subject.errors[:name]).to include('has already been taken')
    end 
  end
end
