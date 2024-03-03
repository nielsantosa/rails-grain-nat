class ModifierGroup < ApplicationRecord
  has_many :item_modifier_groups, dependent: :destroy
  has_many :items, through: :item_modifier_groups

  has_many :modifiers

  validates :label, presence: true
  validates :selection_required_min, numericality: { greater_than_or_equal_to: 0 }
  validates :selection_required_max, numericality: { greater_than_or_equal_to: 0 }
  validate :validate_selection_max_greater_than_or_equal_to_selection_min

  def validate_selection_max_greater_than_or_equal_to_selection_min
    if selection_required_min.present? && selection_required_max.present? && selection_required_max < selection_required_min
      errors.add(:base, "selection_required_max cannot be less than selection_required_min")
    end
  end
end
