# frozen_string_literal: true

module Types
  class ItemModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :item_id, String
    field :modifier_group_id, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :item, Types::ItemType, null: true
    field :modifier_group, Types::ModifierGroupType, null: true
  end
end
