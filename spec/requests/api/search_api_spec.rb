require 'spec_helper'

describe SearchApi do
  let!(:subcategory) { create :category_with_custom_fields, parent: category }
  let!(:category) { create :category_with_custom_fields, parent: parent }
  let!(:parent) { create :category_with_custom_fields }

  describe '#categories_list' do
    subject do
      get '/api/search/categories_list', params: params
    end

    def check_response_json(expected_json)
      subject

      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to eq expected_json
    end

    context 'when category_id null' do
      let(:params) { {} }

      it 'must return all head categories as subcategories' do
        check_response_json(
          current_category: nil,
          parent_category: nil,
          subcategories: [parent.slice(:id, :name).symbolize_keys]
        )
      end
    end

    context 'when category_id points to head category (parent)' do
      let(:params) { { category_id: parent.id } }

      it 'must return json' do
        check_response_json(
          current_category: parent.slice(:id, :name).symbolize_keys,
          parent_category: nil,
          subcategories: [category.slice(:id, :name).symbolize_keys]
        )
      end
    end

    context 'when category_id points to middle category' do
      let(:params) { { category_id: category.id } }

      it 'must return json' do
        check_response_json(
          current_category: category.slice(:id, :name).symbolize_keys,
          parent_category: parent.slice(:id, :name).symbolize_keys,
          subcategories: [subcategory.slice(:id, :name).symbolize_keys]
        )
      end
    end

    context 'when category_id points to last subcategory' do
      let(:params) { { category_id: subcategory.id } }

      it 'must return empty subcategories' do
        check_response_json(
          current_category: subcategory.slice(:id, :name).symbolize_keys,
          parent_category: category.slice(:id, :name).symbolize_keys,
          subcategories: []
        )
      end
    end
  end
end
