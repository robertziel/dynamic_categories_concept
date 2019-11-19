require 'spec_helper'

describe Item, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
  end

  describe 'validations' do
    context '#title' do
      it { should validate_presence_of(:title) }
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
