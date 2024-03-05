# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    field :id, ID, null: false
    field :item_id, Integer, null: false
    field :modifier_group_id, Integer, null: false
    field :display_order, Integer, null: false
    field :default_quantity, Integer, null: false
    field :price_override, Float, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :item, Types::ItemType, null: true
    field :modifier_group, Types::ModifierGroupType, null: true
  end
end
