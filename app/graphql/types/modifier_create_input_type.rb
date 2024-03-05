# frozen_string_literal: true

module Types
  class ModifierCreateInputType < Types::BaseInputObject
    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true
    argument :display_order, Integer
    argument :default_quantity, Integer
    argument :price_override, Integer
  end
end
