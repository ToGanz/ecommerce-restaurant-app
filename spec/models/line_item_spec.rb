require 'rails_helper'

RSpec.describe LineItem, type: :model do
  subject { FactoryBot.create(:line_item) }

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  describe 'before save' do
    subject { FactoryBot.create(:line_item) }

    context '#set_unit_price' do

      it 'unit price is eq to product price' do
        expect(subject.unit_price).to eq(subject.product.price)
      end

      it 'unit price stays the same after save, even though product price changes' do
        subject.product.update(price: 12)
        expect(subject.unit_price).not_to eq(subject.product.price)
      end

    end

    context '#set_total' do

      it 'set total is correct' do
        expect(subject.total).to eq(subject.product.price * subject.quantity)
      end

    end

  end
end
