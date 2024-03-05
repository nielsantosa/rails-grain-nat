# frozen_string_literal: true

module Types
  class ItemModifierGroupCreateInputType < Types::BaseInputObject
    argument :item_id, String, required: true
    argument :modifier_group_id, String, required: true
  end
end
