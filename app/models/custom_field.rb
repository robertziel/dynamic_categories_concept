class CustomField < ApplicationRecord
  BOOLEAN = 'boolean'.freeze
  INTEGER = 'integer'.freeze
  STRING = 'string'.freeze

  FIELD_TYPES = [BOOLEAN, INTEGER, STRING].freeze

  belongs_to :category

  validates :category, :name, presence: true
  validates_inclusion_of :type, in: FIELD_TYPES
end
