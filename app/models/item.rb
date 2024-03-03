class Item < ApplicationRecord
  has_one :section_item
  has_one :section, through: :section_item

  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  def self.subclasses
    %w(Product Component)
  end

  validates :label, presence: true
  validates :type, presence: true, inclusion: { in: ["Product", "Component"] }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
