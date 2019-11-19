class Category < ApplicationRecord
  belongs_to :category
  has_many :categories
  has_many :custom_fields
  has_many :items
end
