class CustomFieldValue < ApplicationRecord
  belongs_to :item
  belongs_to :custom_field
end
