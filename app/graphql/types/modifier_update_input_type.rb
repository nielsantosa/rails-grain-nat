# frozen_string_literal: true

module Types
  class ModifierUpdateInputType < Types::BaseInputObject
    argument :item_id, ID
    argument :modifier_group_id, ID
    argument :display_order, Integer
    argument :default_quantity, Integer
    argument :price_override, Integer
  end
end
