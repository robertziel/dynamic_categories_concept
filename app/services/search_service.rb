class SearchService
  attr_accessor :price, :name

  def initialize(search_params)
    @price_range = search_params[:price] || {}
    @name = search_params[:name]
  end

  def perform
    items = Item
    items = items.where('price >= ?', @price_range[:from]) if @price_range[:from].present?
    items = items.where('price <= ?', @price_range[:to]) if @price_range[:to].present?
    items = items.where("name LIKE '%#{@name}%'") if @name.present?
    items.all
  end
end
