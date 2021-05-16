require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { FactoryBot.create(:order) }
  let(:product) { FactoryBot.create(:product, price: 11.11) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context '#sub_total, #set_total and #number_of_items' do

    it 'is 0' do
      expect(subject.subtotal).to eq(0.0)
      expect(subject.number_of_items).to eq(0)
      subject.set_total
      expect(subject.total).to eq(0.0)
    end

    it 'is equal to product price' do
      subject.line_items.create(product: product,  quantity: 1)
     
      expect(subject.subtotal).to eq(product.price)
      expect(subject.number_of_items).to eq(1)
      subject.set_total
      expect(subject.total).to eq(product.price)
    end

    it 'equal to quantity times price of all line items' do
      product2 = FactoryBot.create(:product, price: 10)
      subject.line_items.create(product: product,  quantity: 2)
      subject.line_items.create(product: product2,  quantity: 3)

      expect(subject.subtotal).to eq(52.22)
      expect(subject.number_of_items).to eq(5)
      subject.set_total
      expect(subject.total).to eq(52.22)
    end

    it 'is 0 after all line items get deleted' do
      product2 = FactoryBot.create(:product, price: 10)
      subject.line_items.create(product: product,  quantity: 2)
      subject.line_items.create(product: product2,  quantity: 3)
      
      subject.set_total
      subject.line_items.delete_all
      subject.set_total
      expect(subject.subtotal).to eq(0)
      expect(subject.number_of_items).to eq(0)
      expect(subject.total).to eq(0)
    end

  end
end
