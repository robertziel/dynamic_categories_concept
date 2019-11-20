class Item < ApplicationRecord
  belongs_to :category
  has_many :custom_field_values, dependent: :destroy

  validates :description, :price, :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
