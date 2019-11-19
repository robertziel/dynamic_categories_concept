class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true
  has_many :subcategories, class_name: 'Category', foreign_key: :category_id, dependent: :destroy
  has_many :custom_fields
  has_many :items
end
