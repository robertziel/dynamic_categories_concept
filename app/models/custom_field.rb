class CustomField < ApplicationRecord
  BIG_DECIMAL = 'big_decimal'.freeze
  STRING = 'string'.freeze
  TEXT_FIELD = 'text_field'.freeze

  FIELD_TYPES = [STRING, TEXT_FIELD, BIG_DECIMAL].freeze

  belongs_to :category

  validates :category, :name, presence: true
  validates_inclusion_of :type, in: FIELD_TYPES
end
