class SearchApi < Grape::API
  resource :search do
    desc 'Search'
    params do
      optional :category_id, type: Integer
      optional :title, type: String
      optional :price_from, type: BigDecimal
      optional :price_to, type: BigDecimal
      # it needs better permit to regonize default fields
      optional :category_filters_values, type: Hash
    end
    get do
      items = serialize_collection(
        SearchService.new(declared(params)).perform,
        serializer: Api::ItemSerializer
      )

      {
        items: items
      }
    end

    resource :categories_list do
      desc 'Categories list'
      params do
        optional :category_id, type: Integer
      end
      get do
        category = Category.find_by(id: params[:category_id])

        Api::CategoriesListSerializer.new(category).as_json
      end
    end

    resource :category_filters do
      desc 'Category filters'
      params do
        optional :category_id, type: Integer
      end
      get do
        category = Category.find_by(id: params[:category_id])

        Api::CategoryFiltersSerializer.new(category).as_json
      end
    end
  end
end
