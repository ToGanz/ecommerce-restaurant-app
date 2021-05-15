require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { FactoryBot.create(:order) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  describe 'before save' do
    let(:product) { FactoryBot.create(:product, price: 11.11) }

    context '#set_total' do

      it 'is equal to product price' do
        subject.line_items.create(product: product,  quantity: 1)
        subject.save
        expect(subject.total).to eq(product.price)
      end

      it 'equal to quantity times  price of all line items' do
        product2 = FactoryBot.create(:product, price: 10)
        subject.line_items.create(product: product,  quantity: 2)
        subject.line_items.create(product: product2,  quantity: 3)
        subject.save
        expect(subject.total).to eq(52.22)
    
      end

      it 'is 0 after all line items get deleted' do
        product2 = FactoryBot.create(:product, price: 10)
        subject.line_items.create(product: product,  quantity: 2)
        subject.line_items.create(product: product2,  quantity: 3)
        subject.save

        subject.line_items.delete_all
        subject.save
        expect(subject.total).to eq(0)
      end

    end
  end
end
