class CustomField < ApplicationRecord
  BOOLEAN = 'boolean'.freeze
  INTEGER = 'integer'.freeze
  STRING = 'string'.freeze

  DATATYPES = [BOOLEAN, INTEGER, STRING].freeze

  belongs_to :category
  has_many :custom_field_values, dependent: :destroy

  validates :category, :name, presence: true
  validates_inclusion_of :datatype, in: DATATYPES
end
