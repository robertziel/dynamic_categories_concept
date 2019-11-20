module Api
  class ItemSerializer < ApplicationSerializer
    attributes :id, :price, :name, :description

    def price
      "#{object.price} $"
    end
  end
end
