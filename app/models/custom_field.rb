class CustomField < ApplicationRecord
  BOOLEAN = 'boolean'.freeze
  INTEGER = 'integer'.freeze
  STRING = 'string'.freeze

  DATATYPES = [BOOLEAN, INTEGER, STRING].freeze

  belongs_to :category

  validates :category, :name, presence: true
  validates_inclusion_of :datatype, in: DATATYPES
end
