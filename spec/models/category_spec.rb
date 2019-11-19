require 'spec_helper'

describe Category, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should have_many(:categories) }
  end
end
