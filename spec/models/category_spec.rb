require 'spec_helper'

describe Category, type: :model do
  describe 'associations' do
    it { should belong_to(:parent).class_name('Category').with_foreign_key('category_id') }
    it { should have_many(:subcategories).class_name('Category').with_foreign_key('category_id') }
    it { should have_many(:custom_fields) }
    it { should have_many(:items) }
  end
end
