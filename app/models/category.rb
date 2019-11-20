class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true
  has_many :subcategories, class_name: 'Category', foreign_key: :category_id, dependent: :destroy
  has_many :custom_fields
  has_many :items

  scope :head_categories, -> { where(parent: nil) }

  def inherited_custom_fields_array
    custom_fields + (parent&.inherited_custom_fields_array || [])
  end
end
