require 'spec_helper'

describe CustomField, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
  end

  describe 'validations' do
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:name) }
    it { should validate_inclusion_of(:type).in_array(described_class::FIELD_TYPES) }
  end
end
