class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section

  # make display_order default to 0
  attribute :display_order, :integer, default: 0

  validates :display_order, numericality: { greater_than_or_equal_to: 0 }
end
