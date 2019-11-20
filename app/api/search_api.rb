class SearchApi < Grape::API
  resource :search do
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
