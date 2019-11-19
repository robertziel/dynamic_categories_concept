require 'spec_helper'

describe Item, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
  end

  describe 'validations' do
    context '#name' do
      it { should validate_presence_of(:name) }
    end

    context '#description' do
      it { should validate_presence_of(:description) }
    end

    context '#price' do
      it { should validate_presence_of(:price) }
      it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    end
  end
end
