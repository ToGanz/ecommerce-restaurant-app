require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { FactoryBot.create(:order) }
  let(:product) { FactoryBot.create(:product, price: 11.11) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context '#sub_total and #set_total' do

    it 'is equal to product price' do
      subject.line_items.create(product: product,  quantity: 1)
     
      expect(subject.subtotal).to eq(product.price)
      subject.set_total
      expect(subject.total).to eq(product.price)
    end

    it 'equal to quantity times  price of all line items' do
      product2 = FactoryBot.create(:product, price: 10)
      subject.line_items.create(product: product,  quantity: 2)
      subject.line_items.create(product: product2,  quantity: 3)

      expect(subject.subtotal).to eq(52.22)
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
      expect(subject.total).to eq(0)
    end

  end
end
