require 'spec_helper'

describe SearchService do
  let!(:item) { create(:item, price: 3.4, name: 'test') }

  describe '#perform' do
    subject do
      described_class.new(params).perform
    end

    context 'params not present' do
      let(:params) { { price_from: '', price_to: '', name: '' } }

      it { expect(subject).to eq [item] }
    end

    describe '#price_from' do
      context 'is higher than item\'s price' do
        let(:params) { { price_from: '3.5', price_to: '', name: '' } }

        it { expect(subject).to eq [] }
      end

      context 'is lower than item\'s price' do
        let(:params) { { price_from: '3.3', price_to: '', name: '' } }

        it { expect(subject).to eq [item] }
      end
    end

    describe '#price_to' do
      context 'is higher than item\'s price' do
        let(:params) { { price_from: '', price_to: '3.5', name: '' } }

        it { expect(subject).to eq [item] }
      end

      context 'is lower than item\'s price' do
        let(:params) { { price_from: '', price_to: '3.3', name: '' } }

        it { expect(subject).to eq [] }
      end
    end

    describe '#name' do
      context 'matches' do
        let(:params) { { price_from: '', price_to: '', name: 'es' } }

        it { expect(subject).to eq [item] }
      end

      context 'does not match' do
        let(:params) { { price_from: '', price_to: '', name: 'des' } }

        it { expect(subject).to eq [] }
      end
    end
  end
end
