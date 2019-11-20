class SearchService
  attr_accessor :price, :name

  def initialize(search_params)
    @category_id = search_params[:category_id]
    @price_range = search_params[:price] || {}
    @name = search_params[:name]
  end

  def perform
    items = Item
    items = belongs_to_any_subcategory(items) if @category_id.present?
    items = items.where('price >= ?', @price_range[:from]) if @price_range[:from].present?
    items = items.where('price <= ?', @price_range[:to]) if @price_range[:to].present?
    items = items.where("name LIKE '%#{@name}%'") if @name.present?
    items.all
  end

  private

  def belongs_to_any_subcategory(items)
    all_categiries_ids = Category.find_with_all_children(@category_id).pluck(:id)
    items.where(category_id: all_categiries_ids)
  end
end
