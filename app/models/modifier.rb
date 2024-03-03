class Modifier < ApplicationRecord
  belongs_to :modifier_group
  belongs_to :item, class_name: "Item", foreign_key: "item_id"

  attribute :default_quantity, :integer, default: 0
  attribute :display_order, :integer, default: 0

  validates :default_quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :display_order, numericality: { greater_than_or_equal_to: 0 }
end
