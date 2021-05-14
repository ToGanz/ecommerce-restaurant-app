require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { FactoryBot.create(:product) }
 
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
    let (:category) { Category.create(name: 'Meat') }
    before { Product.create(name: 'Burger', category: category) }
    subject { Product.create(name: 'Burger', category: category) }

    it 'is not valid' do
      expect(subject.errors[:name]).to include('has already been taken')
    end 
  end

  context '.acceptable_image' do
    subject { FactoryBot.build(:product) }

    it 'is valid' do
      url = URI.parse('https://picsum.photos/1920/1080.jpg')
      file = URI.open(url)
      subject.image.attach(io: open(file), filename: "picsum")
      subject.save
      expect(subject).to be_valid
    end 

    it 'must be a JPEG or PNG' do
      url = URI.parse('https://picsum.photos/1920/1080.webp')
      file = URI.open(url)
      subject.image.attach(io: open(file), filename: "picsum")
      subject.save
      expect(subject.errors[:image]).to include('must be a JPEG or PNG')
    end 

    it 'is too big' do
      url = URI.parse('https://picsum.photos/3000/3000.jpg')
      file = URI.open(url)
      subject.image.attach(io: open(file), filename: "picsum")
      subject.save
      expect(subject.errors[:image]).to include('is too big')
    end 
  end
end
