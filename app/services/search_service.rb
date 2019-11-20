class SearchService
  attr_accessor :price_from, :price_to, :name

  def initialize(search_params)
    @price_from = search_params[:price_from]
    @price_to = search_params[:price_to]
    @name = search_params[:name]
  end

  def perform
    items = Item
    items = items.where('price >= ?', @price_from) if @price_from.present?
    items = items.where('price <= ?', @price_to) if @price_to.present?
    items = items.where("name LIKE '%#{@name}%'") if @name.present?
    items.all
  end
end
