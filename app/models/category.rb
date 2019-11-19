class Category < ApplicationRecord
  belongs_to :category
  has_many :categories
end
