class CustomFieldValue < ApplicationRecord
  belongs_to :item
  belongs_to :custom_field

  validates :custom_field, uniqueness: { scope: :item }
end
