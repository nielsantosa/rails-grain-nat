# frozen_string_literal: true

module Types
  class ItemModifierGroupUpdateInputType < Types::BaseInputObject
    argument :item_id, String
    argument :modifier_group_id
  end
end
