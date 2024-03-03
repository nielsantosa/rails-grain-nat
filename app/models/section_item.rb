class SectionItem < ApplicationRecord
  belongs_to :section
  belongs_to :item

  # assign display_order default to 0
  attribute :display_order, :integer, default: 0

  validates :display_order, numericality: { greater_than_or_equal_to: 0 }
end
